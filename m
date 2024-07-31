Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B37942FD1
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2024 15:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A74010E61F;
	Wed, 31 Jul 2024 13:13:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106A710E61F
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2024 13:13:06 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 46VDD1rO354408; Wed, 31 Jul 2024 18:43:01 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 46VDD11Y354407;
 Wed, 31 Jul 2024 18:43:01 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 0/3] optimize the padding of nops for gfx9 gfx12 and
Date: Wed, 31 Jul 2024 18:42:49 +0530
Message-Id: <20240731131252.354336-1-sunil.khatri@amd.com>
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

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

*** BLURB HERE ***

Sunil Khatri (3):
  drm/amdgpu: optimize the padding for gfx12
  drm/amdgpu: optimize the padding for gfx9
  drm/amdgpu: optimize the padding for gfx_v9_4_3

 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c  | 22 ++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c   | 24 +++++++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 20 +++++++++++++++++++-
 3 files changed, 60 insertions(+), 6 deletions(-)

-- 
2.34.1

