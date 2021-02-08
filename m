Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7203314A48
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Feb 2021 09:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23596ECE1;
	Tue,  9 Feb 2021 08:02:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44536EA52
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Feb 2021 23:40:45 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612827088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SegC4CV6d0P6W49MuLrns6yQuqABgobkVsLrpvW8HeY=;
 b=kr2DAhr74YkqNeARuoMvJoMdyKhsfEpsbHy9kVkAFkoKeCFy+XbwLVU4kHbs8DVRmAEhaT
 VNkKUjILUMYqpGsoOzZznrw1YmZV/iAX1R8WY40YTOGfRS7NDEK+NmQ0A/KTD9X1gekZH5
 +cgqjAukgyXtiuHbrwWM0vNEVBVR9u45beWhtCEAzzwFBqCNW8Qz4SPMGEFqCIKgyOYd8f
 1WqVSBv8m9Vg2z8Koi8guMZCWPl6sJ5AG0zFWjfw4g5VoOc7qMgpTtWoFZ4haT5B9NOenF
 plYyvoJE61ufpNviU6f9jMsxWdF3hnP4bela1n9fHJqw9qI9bag1IR7WWrIgqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612827088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SegC4CV6d0P6W49MuLrns6yQuqABgobkVsLrpvW8HeY=;
 b=yfB/N7DmNnWqSeuabYv12ATEmhQBsZ62ZmJkqTCynRN+Oox+PNj3u7651X492/Bkts/18i
 36Byz2Pso16PDfBA==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm: Replace in_interrupt() usage.
Date: Tue,  9 Feb 2021 00:31:15 +0100
Message-Id: <20210208233119.391103-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Feb 2021 08:02:59 +0000
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
Cc: David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Folks,

in the discussion about preempt count consistency across kernel
configurations:

 https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/

it was concluded that the usage of in_interrupt() and related context
checks should be removed from non-core code.

In the long run, usage of 'preemptible, in_*irq etc.' should be banned from
driver code completely.

This series addresses the gma500 driver and parts of the amdgpu driver.
There are still call sites left in in the amdgpu driver.

Sebastian


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
