<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DatabaseController extends Controller
{
    // ✅ SELECT
    public function select(Request $request)
    {
        $table = $request->input('table');
        $conditions = $request->input('conditions', []);

        try {
            $query = DB::table($table);

            foreach ($conditions as $col => $val) {
                $query->where($col, $val);
            }

            $results = $query->get();

            if ($results->isEmpty()) {
                return response()->json([
                    'success' => false,
                    'message' => 'No records found',
                    'data' => []
                ]);
            }

            return response()->json([
                'success' => true,
                'message' => 'Records fetched successfully',
                'data' => $results
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error: ' . $e->getMessage(),
                'data' => []
            ], 500);
        }
    }

    // ✅ INSERT
    public function insert(Request $request)
    {
        $table = $request->input('table');
        $data  = $request->input('data', []);

        try {
            // Handle file uploads
            if ($request->hasFile('file')) {
                $file = $request->file('file');
                $path = $file->store('uploads', 'public');
                $data['file_path'] = $path;
            }

            $id = DB::table($table)->insertGetId($data);

            return response()->json([
                'success' => true,
                'message' => 'Record inserted successfully',
                'data' => [
                    'id' => $id,
                    'file_path' => $data['file_path'] ?? null
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Insert failed: ' . $e->getMessage(),
                'data' => []
            ], 500);
        }
    }

    // ✅ UPDATE
public function update(Request $request)
{
    $table = $request->input('table');
    // accept either "conditions" or "where"
    $conditions = $request->input('conditions', $request->input('where', []));
    $data = $request->input('data', []);

    try {
        // 🚫 prevent full-table updates
        if (empty($conditions)) {
            return response()->json([
                'success' => false,
                'message' => 'Update failed: No conditions provided (refusing to update all rows)',
                'data' => []
            ], 400);
        }

        // Handle file uploads
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $path = $file->store('uploads', 'public');
            $data['file_path'] = $path;
        }

        // Optional: prevent duplicate emails
        if (isset($data['email']) && isset($conditions['id'])) {
            $exists = DB::table($table)
                ->where('email', $data['email'])
                ->where('id', '!=', $conditions['id'])
                ->exists();

            if ($exists) {
                return response()->json([
                    'success' => false,
                    'message' => 'Email already used by another account',
                    'data' => []
                ], 422);
            }
        }

        $query = DB::table($table);
        foreach ($conditions as $col => $val) {
            $query->where($col, $val);
        }

        $affected = $query->update($data);

        if ($affected > 0) {
            return response()->json([
                'success' => true,
                'message' => 'Record(s) updated successfully',
                'data' => [
                    'affected' => $affected,
                    'file_path' => $data['file_path'] ?? null
                ]
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'No records updated (check conditions)',
                'data' => []
            ]);
        }
    } catch (\Exception $e) {
        return response()->json([
            'success' => false,
            'message' => 'Update failed: ' . $e->getMessage(),
            'data' => []
        ], 500);
    }
}


    // ✅ DELETE
    public function delete(Request $request)
    {
        $table = $request->input('table');
        $conditions = $request->input('conditions', []);

        try {
            $query = DB::table($table);
            foreach ($conditions as $col => $val) {
                $query->where($col, $val);
            }

            $deleted = $query->delete();

            if ($deleted > 0) {
                return response()->json([
                    'success' => true,
                    'message' => 'Record(s) deleted successfully',
                    'data' => ['deleted' => $deleted]
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'No records deleted (check conditions)',
                    'data' => []
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Delete failed: ' . $e->getMessage(),
                'data' => []
            ], 500);
        }
    }

    // ✅ CUSTOM SQL
    public function custom(Request $request)
    {
        $sql = $request->input('sql');
        $bindings = $request->input('bindings', []);

        try {
            $result = DB::select($sql, $bindings);

            return response()->json([
                'success' => true,
                'message' => 'Custom query executed successfully',
                'data' => $result
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Custom query failed: ' . $e->getMessage(),
                'data' => []
            ], 500);
        }
    }
}
