Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0D360CD21
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Oct 2022 15:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E9D10E378;
	Tue, 25 Oct 2022 13:12:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B7189A5E;
 Tue, 25 Oct 2022 09:12:09 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id g129so9291063pgc.7;
 Tue, 25 Oct 2022 02:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xGVOD/2VPjGiBRav22AYMwWy4zxh7fmfTMDotebo6hU=;
 b=IiF+9H7HDBvMko4kvyz08iL4jk0sxX0hNcDqSZOVzhEfkq3VldocjhlbifIuF33l4v
 TISqYvzkqU5+iaXJnFpxZI4myVYsfqHxtJc5DN769q9+w+cEk6i5l5/pNf+17dpYTHoy
 Yrq74N1XEG8LbDs9OVJwxcKUf6Z/5TXYk+U6zy/EVoUmmtvzE0+hF34oU2D7Kd6x8SFl
 j3AnRhGmOnfYmPums2ywjIk/q8Tq4Kyv0conadgtJ19IHKu6wFvaALV0LfDXbzLnvKkg
 33+95aMWuJqWos8QpVVPgHLK42bBz7gvdVSLkCVxSvwH2GIyrqa7qz6XV6qfGPl/FKTq
 nF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xGVOD/2VPjGiBRav22AYMwWy4zxh7fmfTMDotebo6hU=;
 b=Zh9MZSs0Mfe4IAd1z7EOkZdzTw7nRnMm9Z2ED6OyAy6/kQI9u8P/ymXq11p6cFdd/A
 VmuNiR8BU6hlnoAIfYGc6C9lel0zT+yr0MR8/hjJgEySyvOWn2EErqMXxWjlcJzlUvIb
 92T2VPHYsIVSaB1qOqgrKg8eUb00PKmInBQ1bqf6Qf0/Wwgwha7gJtoACeH5splMh+wX
 +IoOTWvKOnzd32Svs/eweR2Ck0CJRJMBEBoK9Ii2AzKoyQFV0jGXTy5eLCrBRoF/Ichw
 eosa9MUJF8F/rTRe0qw+px+abJr/nIiqDiqtr2a9zM7NyCIV2CrkwB+jfAHpDGWwmwGg
 ePwg==
X-Gm-Message-State: ACrzQf00gHYtQH2txccZTfuUAd/46QwfijNKhqcxmfq9txxnH02Nmuuk
 aGy+QeGkSiyyjC7eIAg7HVs=
X-Google-Smtp-Source: AMsMyM7nReHG+DxExO3yNsZWg9FWsmN+c9TS6v6XjbAsRncGxUpOUqx69/NCOLmMtNa5fJw12Icl3g==
X-Received: by 2002:aa7:838a:0:b0:536:101a:9ccf with SMTP id
 u10-20020aa7838a000000b00536101a9ccfmr37281309pfm.18.1666689129044; 
 Tue, 25 Oct 2022 02:12:09 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 k1-20020a170902c40100b00186a8085382sm896604plk.43.2022.10.25.02.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 02:12:08 -0700 (PDT)
Date: Tue, 25 Oct 2022 22:12:00 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] [next] amdkfd: remove unused kfd_pm4_headers_diq header file
Message-ID: <Y1eoYDDZWdyLNlBc@mail.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 25 Oct 2022 13:12:08 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: paulo.miguel.almeida.rodenas@gmail.com, linux-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

kfd_pm4_headers_diq.h header is a leftover from the old H/W debugger
module support added on commit <fbeb661bfa895dc>. That implementation
was removed after a while and the last file that included that header
was removed on commit <5bdd3eb253544b1>.

This patch removes the unused header file kfd_pm4_headers_diq.h

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 .../gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h  | 291 ------------------
 1 file changed, 291 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h
deleted file mode 100644
index f9cd28690151..000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h
+++ /dev/null
@@ -1,291 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR MIT */
-/*
- * Copyright 2014-2022 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-
-#ifndef KFD_PM4_HEADERS_DIQ_H_
-#define KFD_PM4_HEADERS_DIQ_H_
-
-/*--------------------_INDIRECT_BUFFER-------------------- */
-
-#ifndef _PM4__INDIRECT_BUFFER_DEFINED
-#define _PM4__INDIRECT_BUFFER_DEFINED
-enum _INDIRECT_BUFFER_cache_policy_enum {
-	cache_policy___indirect_buffer__lru = 0,
-	cache_policy___indirect_buffer__stream = 1,
-	cache_policy___indirect_buffer__bypass = 2
-};
-
-enum {
-	IT_INDIRECT_BUFFER_PASID = 0x5C
-};
-
-struct pm4__indirect_buffer_pasid {
-	union {
-		union PM4_MES_TYPE_3_HEADER header;	/* header */
-		unsigned int ordinal1;
-	};
-
-	union {
-		struct {
-			unsigned int reserved1:2;
-			unsigned int ib_base_lo:30;
-		} bitfields2;
-		unsigned int ordinal2;
-	};
-
-	union {
-		struct {
-			unsigned int ib_base_hi:16;
-			unsigned int reserved2:16;
-		} bitfields3;
-		unsigned int ordinal3;
-	};
-
-	union {
-		unsigned int control;
-		unsigned int ordinal4;
-	};
-
-	union {
-		struct {
-			unsigned int pasid:10;
-			unsigned int reserved4:22;
-		} bitfields5;
-		unsigned int ordinal5;
-	};
-
-};
-
-#endif
-
-/*--------------------_RELEASE_MEM-------------------- */
-
-#ifndef _PM4__RELEASE_MEM_DEFINED
-#define _PM4__RELEASE_MEM_DEFINED
-enum _RELEASE_MEM_event_index_enum {
-	event_index___release_mem__end_of_pipe = 5,
-	event_index___release_mem__shader_done = 6
-};
-
-enum _RELEASE_MEM_cache_policy_enum {
-	cache_policy___release_mem__lru = 0,
-	cache_policy___release_mem__stream = 1,
-	cache_policy___release_mem__bypass = 2
-};
-
-enum _RELEASE_MEM_dst_sel_enum {
-	dst_sel___release_mem__memory_controller = 0,
-	dst_sel___release_mem__tc_l2 = 1,
-	dst_sel___release_mem__queue_write_pointer_register = 2,
-	dst_sel___release_mem__queue_write_pointer_poll_mask_bit = 3
-};
-
-enum _RELEASE_MEM_int_sel_enum {
-	int_sel___release_mem__none = 0,
-	int_sel___release_mem__send_interrupt_only = 1,
-	int_sel___release_mem__send_interrupt_after_write_confirm = 2,
-	int_sel___release_mem__send_data_after_write_confirm = 3
-};
-
-enum _RELEASE_MEM_data_sel_enum {
-	data_sel___release_mem__none = 0,
-	data_sel___release_mem__send_32_bit_low = 1,
-	data_sel___release_mem__send_64_bit_data = 2,
-	data_sel___release_mem__send_gpu_clock_counter = 3,
-	data_sel___release_mem__send_cp_perfcounter_hi_lo = 4,
-	data_sel___release_mem__store_gds_data_to_memory = 5
-};
-
-struct pm4__release_mem {
-	union {
-		union PM4_MES_TYPE_3_HEADER header;	/*header */
-		unsigned int ordinal1;
-	};
-
-	union {
-		struct {
-			unsigned int event_type:6;
-			unsigned int reserved1:2;
-			enum _RELEASE_MEM_event_index_enum event_index:4;
-			unsigned int tcl1_vol_action_ena:1;
-			unsigned int tc_vol_action_ena:1;
-			unsigned int reserved2:1;
-			unsigned int tc_wb_action_ena:1;
-			unsigned int tcl1_action_ena:1;
-			unsigned int tc_action_ena:1;
-			unsigned int reserved3:6;
-			unsigned int atc:1;
-			enum _RELEASE_MEM_cache_policy_enum cache_policy:2;
-			unsigned int reserved4:5;
-		} bitfields2;
-		unsigned int ordinal2;
-	};
-
-	union {
-		struct {
-			unsigned int reserved5:16;
-			enum _RELEASE_MEM_dst_sel_enum dst_sel:2;
-			unsigned int reserved6:6;
-			enum _RELEASE_MEM_int_sel_enum int_sel:3;
-			unsigned int reserved7:2;
-			enum _RELEASE_MEM_data_sel_enum data_sel:3;
-		} bitfields3;
-		unsigned int ordinal3;
-	};
-
-	union {
-		struct {
-			unsigned int reserved8:2;
-			unsigned int address_lo_32b:30;
-		} bitfields4;
-		struct {
-			unsigned int reserved9:3;
-			unsigned int address_lo_64b:29;
-		} bitfields5;
-		unsigned int ordinal4;
-	};
-
-	unsigned int address_hi;
-
-	unsigned int data_lo;
-
-	unsigned int data_hi;
-
-};
-#endif
-
-
-/*--------------------_SET_CONFIG_REG-------------------- */
-
-#ifndef _PM4__SET_CONFIG_REG_DEFINED
-#define _PM4__SET_CONFIG_REG_DEFINED
-
-struct pm4__set_config_reg {
-	union {
-		union PM4_MES_TYPE_3_HEADER header;	/*header */
-		unsigned int ordinal1;
-	};
-
-	union {
-		struct {
-			unsigned int reg_offset:16;
-			unsigned int reserved1:7;
-			unsigned int vmid_shift:5;
-			unsigned int insert_vmid:1;
-			unsigned int reserved2:3;
-		} bitfields2;
-		unsigned int ordinal2;
-	};
-
-	unsigned int reg_data[1];	/*1..N of these fields */
-
-};
-#endif
-
-/*--------------------_WAIT_REG_MEM-------------------- */
-
-#ifndef _PM4__WAIT_REG_MEM_DEFINED
-#define _PM4__WAIT_REG_MEM_DEFINED
-enum _WAIT_REG_MEM_function_enum {
-	function___wait_reg_mem__always_pass = 0,
-	function___wait_reg_mem__less_than_ref_value = 1,
-	function___wait_reg_mem__less_than_equal_to_the_ref_value = 2,
-	function___wait_reg_mem__equal_to_the_reference_value = 3,
-	function___wait_reg_mem__not_equal_reference_value = 4,
-	function___wait_reg_mem__greater_than_or_equal_reference_value = 5,
-	function___wait_reg_mem__greater_than_reference_value = 6,
-	function___wait_reg_mem__reserved = 7
-};
-
-enum _WAIT_REG_MEM_mem_space_enum {
-	mem_space___wait_reg_mem__register_space = 0,
-	mem_space___wait_reg_mem__memory_space = 1
-};
-
-enum _WAIT_REG_MEM_operation_enum {
-	operation___wait_reg_mem__wait_reg_mem = 0,
-	operation___wait_reg_mem__wr_wait_wr_reg = 1
-};
-
-struct pm4__wait_reg_mem {
-	union {
-		union PM4_MES_TYPE_3_HEADER header;	/*header */
-		unsigned int ordinal1;
-	};
-
-	union {
-		struct {
-			enum _WAIT_REG_MEM_function_enum function:3;
-			unsigned int reserved1:1;
-			enum _WAIT_REG_MEM_mem_space_enum mem_space:2;
-			enum _WAIT_REG_MEM_operation_enum operation:2;
-			unsigned int reserved2:24;
-		} bitfields2;
-		unsigned int ordinal2;
-	};
-
-	union {
-		struct {
-			unsigned int reserved3:2;
-			unsigned int memory_poll_addr_lo:30;
-		} bitfields3;
-		struct {
-			unsigned int register_poll_addr:16;
-			unsigned int reserved4:16;
-		} bitfields4;
-		struct {
-			unsigned int register_write_addr:16;
-			unsigned int reserved5:16;
-		} bitfields5;
-		unsigned int ordinal3;
-	};
-
-	union {
-		struct {
-			unsigned int poll_address_hi:16;
-			unsigned int reserved6:16;
-		} bitfields6;
-		struct {
-			unsigned int register_write_addr:16;
-			unsigned int reserved7:16;
-		} bitfields7;
-		unsigned int ordinal4;
-	};
-
-	unsigned int reference;
-
-	unsigned int mask;
-
-	union {
-		struct {
-			unsigned int poll_interval:16;
-			unsigned int reserved8:16;
-		} bitfields8;
-		unsigned int ordinal7;
-	};
-
-};
-#endif
-
-
-#endif /* KFD_PM4_HEADERS_DIQ_H_ */
-- 
2.37.3

