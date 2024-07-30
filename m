Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB31940882
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2024 08:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0407A10E2B6;
	Tue, 30 Jul 2024 06:40:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C222510E2B6
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2024 06:40:17 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 46U6eCbX4185770; Tue, 30 Jul 2024 12:10:12 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 46U6eBO74185763;
 Tue, 30 Jul 2024 12:10:11 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 0/2] Clean the debugfs register_dump_register_list
Date: Tue, 30 Jul 2024 12:10:06 +0530
Message-Id: <20240730064008.4185728-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Debugfs and devcoredump cleanup with removal of register list for dump

Sunil Khatri (2):
  drm/amdgpu: Remove debugfs amdgpu_reset_dump_register_list
  drm/amdgpu: Clean up the register dump via debugfs list

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           | 13 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 96 -------------------
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 19 ----
 4 files changed, 1 insertion(+), 137 deletions(-)

-- 
2.34.1

