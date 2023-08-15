Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C3C77D397
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Aug 2023 21:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9415510E282;
	Tue, 15 Aug 2023 19:51:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD1710E27D;
 Tue, 15 Aug 2023 19:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U1upXN1liKNdNJ8lhA+6KkUJ6VSnZrhHX5/fflVoWPI=; b=X40McIgnyNqo9cFGaNg7yW8uPe
 gDDGHogBk4WmedT8g4mHN3rrFdlGiifPENTfOk+n09kRfc9Q+6eNkL/pgiorTZJpk9Qj0xCf9IjaV
 X/Gu98WPDzX11QMJ0+LcagQID6uhHapspJIw5wLJx/DrDDbs4YCwbaAC4UJsvjGP7nVVJ1DtDZKrO
 PNSQFjft1PIJruMi3SDCXFrqYCM20k2keTMr2w5hMNVRayzk58wfPaU8N2lDBDuTy6yUU9LQh0RBw
 ++qHOEawk1N6D40l613YazlZ7NbHn39XYEMTp7n9ARhMCBClf8xa/CnHSTKGEpiRKlhhbq0kIDe+G
 hW/arFUQ==;
Received: from [191.193.179.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qW04V-001DUX-W5; Tue, 15 Aug 2023 21:51:20 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] drm/amdgpu: Rework coredump memory allocation
Date: Tue, 15 Aug 2023 16:50:56 -0300
Message-ID: <20230815195100.294458-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

The patches of this set are a rework to alloc devcoredump dynamically and to
move it to a better source file.

Thanks,
	André

Changelog:

v3: https://lore.kernel.org/dri-devel/20230810192330.198326-1-andrealmeid@igalia.com/
- Changed from kmalloc to kzalloc
- Dropped "Create a module param to disable soft recovery" for now

v2: https://lore.kernel.org/dri-devel/20230713213242.680944-1-andrealmeid@igalia.com/
- Drop the IB and ring patch
- Drop patch that limited information from kernel threads
- Add patch to move coredump to amdgpu_reset

v1: https://lore.kernel.org/dri-devel/20230711213501.526237-1-andrealmeid@igalia.com/
 - Drop "Mark contexts guilty for causing soft recoveries" patch
 - Use GFP_NOWAIT for devcoredump allocation

André Almeida (4):
  drm/amdgpu: Allocate coredump memory in a nonblocking way
  drm/amdgpu: Rework coredump to use memory dynamically
  drm/amdgpu: Move coredump code to amdgpu_reset file
  drm/amdgpu: Create version number for coredumps

 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  5 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 67 +------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 77 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  | 14 ++++
 4 files changed, 94 insertions(+), 69 deletions(-)

-- 
2.41.0

