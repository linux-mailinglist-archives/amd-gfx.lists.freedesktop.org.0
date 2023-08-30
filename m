Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA38678DE91
	for <lists+amd-gfx@lfdr.de>; Wed, 30 Aug 2023 21:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367FB10E0F7;
	Wed, 30 Aug 2023 19:05:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A7C10E0F7
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Aug 2023 18:58:08 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-68a1af910e0so4231000b3a.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Aug 2023 11:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1693421888; x=1694026688; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c7VJ/fkol9DLzIYknMej1bs7pH/h+bM39shT1LJdITQ=;
 b=NGmkB3Ifdkf7azZoBYSBk4zVqMH/jYzpSwxhwFyfwoou9aCLDbAXcSWO05rkfgeLAb
 OqjIdeOT85ZIKOhotRrL5W7irLvYgNejStnF6ONDxFrq0cqP14tWdAnyWEMUHWaFTXN/
 Uaq5rIIFevAUpJAwiMTXTzo2cAE7gJp4OoCJ2TmQSeQbdIa4Mr5akQ4IkHC64BtWQKEz
 ERj1b4thxjtHFf4BAl7uunUoa/FT20g2Cf2qMoe8u6xOWg58p0FgMKptr0Igq9vzmkap
 AkLN7ZdQxXQrbwaGP14CIa4c8IdQRC7yL+q9eCAx7ONETFqRoujOcaC4vyaAT8IAWEYN
 hQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693421888; x=1694026688;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c7VJ/fkol9DLzIYknMej1bs7pH/h+bM39shT1LJdITQ=;
 b=M8V3rDGKEZEQqkKHUVwxdSS5WlifDE1h/ctBcJOYcqSyDAcLj88g4MQeR1j9jxEhux
 vmtWz+n7p7alunGOOahdeAundtF5keF8fRes1RFrmkOb26876MYGR+kMVytIhUh29d64
 2S2hDRBNt1ZL9Xiw95lYJlC2ZkUdtyzHVgh9upOdk01KlcXI5LZFlkcpl45LXrCmarTK
 LnogxFYVOPobYyCUdQj/YtWs7flIlhVfikmjr+ddZND7aSearhov7FYRKk3uD63585W5
 vie9GjD4/GaHaDFhvUHMhakMcXeJZDUTGlJvLZhaZmlIez99kX+BTK2M2doYg33gBAel
 yhlQ==
X-Gm-Message-State: AOJu0YwIJhe5gpWwd9qiBDpLpCfqCWRusoTZ9s4ND/jb3CIsMVwfy0mv
 SIuXcze5NmLSQ9ceu3hoFk+0xw==
X-Google-Smtp-Source: AGHT+IHBwJbRUA1G67hWwL5HK4wwlzT6w0g5K3CYGUziqjCrKALq7+w4aQ1uqib6vPunFEZ4/x6Asw==
X-Received: by 2002:a05:6a21:3395:b0:13b:a2c9:922e with SMTP id
 yy21-20020a056a21339500b0013ba2c9922emr3682354pzb.27.1693421887930; 
 Wed, 30 Aug 2023 11:58:07 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a17090322cb00b001bde440e693sm11453565plg.44.2023.08.30.11.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 11:58:07 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/amd/pm: Replace 1-element arrays with flexible array
 members
Date: Wed, 30 Aug 2023 11:57:32 -0700
Message-ID: <20230830185805.1126402-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Aug 2023 19:05:46 +0000
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Since commit df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3"),
UBSAN_BOUNDS no longer pretends 1-element arrays are unbounded. The
bounds check is tripped in smu7_get_pp_table_entry_callback_func_v1(),
while reading from mclk_dep_table.

For consistency, fix all affected struct definitions in this file.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 .../drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h
index b0ac4d121adc..fb5e935ef786 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h
@@ -164,7 +164,7 @@ typedef struct _ATOM_Tonga_State {
 typedef struct _ATOM_Tonga_State_Array {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries;		/* Number of entries. */
-	ATOM_Tonga_State entries[1];	/* Dynamically allocate entries. */
+	ATOM_Tonga_State entries[];	/* Dynamically allocate entries. */
 } ATOM_Tonga_State_Array;
 
 typedef struct _ATOM_Tonga_MCLK_Dependency_Record {
@@ -179,7 +179,7 @@ typedef struct _ATOM_Tonga_MCLK_Dependency_Record {
 typedef struct _ATOM_Tonga_MCLK_Dependency_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries; 										/* Number of entries. */
-	ATOM_Tonga_MCLK_Dependency_Record entries[1];				/* Dynamically allocate entries. */
+	ATOM_Tonga_MCLK_Dependency_Record entries[];				/* Dynamically allocate entries. */
 } ATOM_Tonga_MCLK_Dependency_Table;
 
 typedef struct _ATOM_Tonga_SCLK_Dependency_Record {
@@ -194,7 +194,7 @@ typedef struct _ATOM_Tonga_SCLK_Dependency_Record {
 typedef struct _ATOM_Tonga_SCLK_Dependency_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries; 										/* Number of entries. */
-	ATOM_Tonga_SCLK_Dependency_Record entries[1];				 /* Dynamically allocate entries. */
+	ATOM_Tonga_SCLK_Dependency_Record entries[];				 /* Dynamically allocate entries. */
 } ATOM_Tonga_SCLK_Dependency_Table;
 
 typedef struct _ATOM_Polaris_SCLK_Dependency_Record {
@@ -210,7 +210,7 @@ typedef struct _ATOM_Polaris_SCLK_Dependency_Record {
 typedef struct _ATOM_Polaris_SCLK_Dependency_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries;							/* Number of entries. */
-	ATOM_Polaris_SCLK_Dependency_Record entries[1];				 /* Dynamically allocate entries. */
+	ATOM_Polaris_SCLK_Dependency_Record entries[];				 /* Dynamically allocate entries. */
 } ATOM_Polaris_SCLK_Dependency_Table;
 
 typedef struct _ATOM_Tonga_PCIE_Record {
@@ -222,7 +222,7 @@ typedef struct _ATOM_Tonga_PCIE_Record {
 typedef struct _ATOM_Tonga_PCIE_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries; 										/* Number of entries. */
-	ATOM_Tonga_PCIE_Record entries[1];							/* Dynamically allocate entries. */
+	ATOM_Tonga_PCIE_Record entries[];							/* Dynamically allocate entries. */
 } ATOM_Tonga_PCIE_Table;
 
 typedef struct _ATOM_Polaris10_PCIE_Record {
@@ -235,7 +235,7 @@ typedef struct _ATOM_Polaris10_PCIE_Record {
 typedef struct _ATOM_Polaris10_PCIE_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries;                                         /* Number of entries. */
-	ATOM_Polaris10_PCIE_Record entries[1];                      /* Dynamically allocate entries. */
+	ATOM_Polaris10_PCIE_Record entries[];                       /* Dynamically allocate entries. */
 } ATOM_Polaris10_PCIE_Table;
 
 
@@ -252,7 +252,7 @@ typedef struct _ATOM_Tonga_MM_Dependency_Record {
 typedef struct _ATOM_Tonga_MM_Dependency_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries; 										/* Number of entries. */
-	ATOM_Tonga_MM_Dependency_Record entries[1]; 			   /* Dynamically allocate entries. */
+	ATOM_Tonga_MM_Dependency_Record entries[];			   /* Dynamically allocate entries. */
 } ATOM_Tonga_MM_Dependency_Table;
 
 typedef struct _ATOM_Tonga_Voltage_Lookup_Record {
@@ -265,7 +265,7 @@ typedef struct _ATOM_Tonga_Voltage_Lookup_Record {
 typedef struct _ATOM_Tonga_Voltage_Lookup_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries; 										/* Number of entries. */
-	ATOM_Tonga_Voltage_Lookup_Record entries[1];				/* Dynamically allocate entries. */
+	ATOM_Tonga_Voltage_Lookup_Record entries[];				/* Dynamically allocate entries. */
 } ATOM_Tonga_Voltage_Lookup_Table;
 
 typedef struct _ATOM_Tonga_Fan_Table {
@@ -367,7 +367,7 @@ typedef struct _ATOM_Tonga_VCE_State_Record {
 typedef struct _ATOM_Tonga_VCE_State_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries;
-	ATOM_Tonga_VCE_State_Record entries[1];
+	ATOM_Tonga_VCE_State_Record entries[];
 } ATOM_Tonga_VCE_State_Table;
 
 typedef struct _ATOM_Tonga_PowerTune_Table {
@@ -482,7 +482,7 @@ typedef struct _ATOM_Tonga_Hard_Limit_Record {
 typedef struct _ATOM_Tonga_Hard_Limit_Table {
 	UCHAR ucRevId;
 	UCHAR ucNumEntries;
-	ATOM_Tonga_Hard_Limit_Record entries[1];
+	ATOM_Tonga_Hard_Limit_Record entries[];
 } ATOM_Tonga_Hard_Limit_Table;
 
 typedef struct _ATOM_Tonga_GPIO_Table {
-- 
2.41.0

