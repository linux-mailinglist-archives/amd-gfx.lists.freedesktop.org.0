Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C4A83FA17
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Jan 2024 22:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6039310F8D8;
	Sun, 28 Jan 2024 21:25:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B6D10F853;
 Sun, 28 Jan 2024 21:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MNiq0HNP4Q9Rqomb+cMUTJBSTivA7YPuGDdGMrmslc0=; b=Tj4qXk8M5MGR2/SV09cUxgKkji
 PdCr4hKuDhjJIBXLeGZ/XFYbFKr+eTPPK71e2cF0+DKbH30y7ZWmikT9C8ApW69kHrtrDWoMopApS
 By4xFIiOnrLlI/MLfMyG+bzobIb4X6zdVpJ8Gisb4ye3EYAagSF6Vw5fZOSwO5fPHhOetySdfLJym
 w/aEkWAYhlWIKU0wJ2n2gvYT5yqN4NQrbTlFqKh35Sa6rv18BOvZ0hBCCL2icXCDyvEYPDlLUFOdL
 junGRoQIvRmdXe5glxcAWtxj3HGDGMtPWxScL03NwkSu0fzoFDehFZ61X/yoGlemuN3QN8nJ8TuP3
 ZtYygtSA==;
Received: from 201-42-129-61.dsl.telesp.net.br ([201.42.129.61]
 helo=steammachine.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rUCeY-00B1M8-Gj; Sun, 28 Jan 2024 22:25:22 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] drm/atomic: Allow drivers to write their own plane
 check for async
Date: Sun, 28 Jan 2024 18:25:12 -0300
Message-ID: <20240128212515.630345-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>, daniel@ffwll.ch,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Simon Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Joshua Ashton <joshua@froggi.es>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Dave Airlie <airlied@gmail.com>,
 christian.koenig@amd.com, ville.syrjala@linux.intel.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

AMD hardware can do more on the async flip path than just the primary plane, so
to lift up the current restrictions, this patchset allows drivers to write their
own check for planes for async flips.

This patchset allows for async commits with IN_FENCE_ID in any driver and
overlay planes on AMD. Userspace can query if a driver supports this with
TEST_ONLY commits.

Changes from v2:
 - Allow IN_FENCE_ID for any driver
 - Allow overlay planes again
v2: https://lore.kernel.org/lkml/20240119181235.255060-1-andrealmeid@igalia.com/

Changes from v1:
 - Drop overlay planes option for now
v1: https://lore.kernel.org/dri-devel/20240116045159.1015510-1-andrealmeid@igalia.com/

André Almeida (3):
  drm/atomic: Allow drivers to write their own plane check for async
    flips
  drm/atomic: Allow userspace to use explicit sync with atomic async
    flips
  drm/amdgpu: Implement check_async_props for planes

 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 29 +++++++++
 drivers/gpu/drm/drm_atomic_uapi.c             | 63 ++++++++++++++-----
 include/drm/drm_atomic_uapi.h                 | 12 ++++
 include/drm/drm_plane.h                       |  5 ++
 4 files changed, 92 insertions(+), 17 deletions(-)

-- 
2.43.0

