Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A088A2A0B
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Apr 2024 11:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D013110EA98;
	Fri, 12 Apr 2024 09:00:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A4310EA98
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Apr 2024 09:00:24 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 43C90JbL010935; Fri, 12 Apr 2024 14:30:19 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 43C90IWC010934;
 Fri, 12 Apr 2024 14:30:18 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH 0/2] First set in IP dump patches
Date: Fri, 12 Apr 2024 14:30:11 +0530
Message-Id: <20240412090016.10897-1-sunil.khatri@amd.com>
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

Adding infrastructure needed for ipdump along
with dumping gfx10 registers.

Sunil Khatri (2):
  drm/amdgpu: add prototype to dump ip state
  drm/amdgpu: Add support of gfx10 register dump

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  16 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c       |   1 +
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  |  22 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |   1 +
 drivers/gpu/drm/amd/amdgpu/cik.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/cik_ih.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/cz_ih.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 142 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c          |   1 +
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c          |   1 +
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c          |   1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c        |   2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c      |   1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c      |   1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c      |   1 +
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/nv.c               |   1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/si.c               |   1 +
 drivers/gpu/drm/amd/amdgpu/si_dma.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/si_ih.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/soc15.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/soc21.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c         |   2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/vi.c               |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 +
 drivers/gpu/drm/amd/include/amd_shared.h      |   1 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c    |   1 +
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c    |   1 +
 .../gpu/drm/amd/pm/powerplay/amd_powerplay.c  |   1 +
 66 files changed, 245 insertions(+)

-- 
2.34.1

