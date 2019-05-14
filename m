Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 956561C8C5
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 14:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21385892F1;
	Tue, 14 May 2019 12:31:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85C1892F1;
 Tue, 14 May 2019 12:31:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y3so2694620wmm.2;
 Tue, 14 May 2019 05:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GotozzQHrgeeNHLIyU2r/4FYuUgEY3mDRRbcmbzAvt8=;
 b=YlGcxCkUzBMb6/Edqpk2rHTDAvTicdYUGVfKig7OTpziPAn2lKX3VBk8JEaXGVuqsA
 ZQeCeszCpqYS3NaUy4M0qoleITTuFt8mb31s/SiHnL6/NgijgDOb6dw7S5fouenPwREI
 9ylSyihb2vTZbUQSaKJiKTJoCWIeBWfq6GYNGak7guR/BrZg2UZt6EK36p0l0t0gYExE
 so/ziE/e6O81YSwf96XIhYHLFgegMj2rsjyhX5lAy+DDvfNpV/MmaCkraievKYcVozK4
 QwhuAqf2xKFG/hm2SBsL9l7K/Kj/WobYAVG26zO0H7d3jxUWlVDbz3GK3Rf91Xqv0eMv
 EqVQ==
X-Gm-Message-State: APjAAAWfkX6osuUhX5N4ve84XnwMj+Lb/qeAF4Qxog7PZDd3A4B5I2+6
 zW4/pBI+Z7EhvRwJttTvDzMSH4Y1
X-Google-Smtp-Source: APXvYqxeJ1PL58t5EPqMDrbsqN4sfdbbiXl7maPkg+6ltU2Gn4sBQj8ONIjjvIHZXSN8+3cFX2UPBA==
X-Received: by 2002:a1c:4102:: with SMTP id o2mr18056917wma.91.1557837099549; 
 Tue, 14 May 2019 05:31:39 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7d94:f6f9:368b:5a3b])
 by smtp.gmail.com with ESMTPSA id n4sm6128704wmb.22.2019.05.14.05.31.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 05:31:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU during CS
Date: Tue, 14 May 2019 14:31:27 +0200
Message-Id: <20190514123127.1650-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514123127.1650-1-christian.koenig@amd.com>
References: <20190514123127.1650-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GotozzQHrgeeNHLIyU2r/4FYuUgEY3mDRRbcmbzAvt8=;
 b=c/hzLOX6QgaQTz/Lc6uNX25oMJu30E48RB7VcVJD+oNoIj6j7aAC9j/l+AEoIZEsOI
 sg3Io0GbQleJztLUKtGfUwmlUfNoijwTD2QReHNscnS/b0nueoHckSZ3S9zeMUDi9sax
 GlFLvDGibXtzdgqK/TBOlAHOc/7T8HXkeqxZGLSSfrQAX4bB1vBmo2Pov/3Zwl9nKwV8
 F98rp5ghzaC5LCtorTRpFwX+fKeCVxOiQrL0BbA2b9a146rs7ZDqHPpKsZx+xqJeACAX
 xAlJaLx/0ft19G8sndheEFl7xiM4WPvgoBNJLJJo+IS4ZXfhVKufE0871cozAto9g1mz
 H4og==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBhdm9pZHMgT09NIHNpdHVhdGlvbnMgd2hlbiB3ZSBoYXZlIGxvdHMgb2YgdGhyZWFkcwpz
dWJtaXR0aW5nIGF0IHRoZSBzYW1lIHRpbWUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2NzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCmluZGV4
IGZmZjU1OGNmMzg1Yi4uZjkyNDBhOTQyMTdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfY3MuYwpAQCAtNjQ4LDcgKzY0OCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3BhcnNl
cl9ib3Moc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCiAJfQogCiAJciA9IHR0bV9ldV9yZXNl
cnZlX2J1ZmZlcnMoJnAtPnRpY2tldCwgJnAtPnZhbGlkYXRlZCwgdHJ1ZSwKLQkJCQkgICAmZHVw
bGljYXRlcywgdHJ1ZSk7CisJCQkJICAgJmR1cGxpY2F0ZXMsIGZhbHNlKTsKIAlpZiAodW5saWtl
bHkociAhPSAwKSkgewogCQlpZiAociAhPSAtRVJFU1RBUlRTWVMpCiAJCQlEUk1fRVJST1IoInR0
bV9ldV9yZXNlcnZlX2J1ZmZlcnMgZmFpbGVkLlxuIik7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
