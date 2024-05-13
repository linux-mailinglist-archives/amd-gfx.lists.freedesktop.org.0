Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CBB8C42AA
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2024 15:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2830910E7C7;
	Mon, 13 May 2024 13:57:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DFB10E7B8
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2024 13:57:29 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 44DDvGEL296633; Mon, 13 May 2024 19:27:16 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 44DDvFQ4296632;
 Mon, 13 May 2024 19:27:15 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 0/4] Add CP and GFX Queue register in ip Dump for
Date: Mon, 13 May 2024 19:27:10 +0530
Message-Id: <20240513135714.296582-1-sunil.khatri@amd.com>
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

*** BLURB HERE ***

Sunil Khatri (4):
  drm/amdgpu: update the ip_dump to ipdump_core
  drm/amdgpu: Add support to dump gfx10 cp registers
  drm/amdgpu: add support to dump gfx10 queue registers
  drm/amdgpu: add prints while ip registr dump

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h    |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c     | 214 +++++++++++++++++++--
 3 files changed, 208 insertions(+), 12 deletions(-)

-- 
2.34.1

