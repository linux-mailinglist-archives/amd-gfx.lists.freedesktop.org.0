Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF6FA5471
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Sep 2019 12:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F8C89B49;
	Mon,  2 Sep 2019 10:52:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C323589B30
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 10:52:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y19so13537517wrd.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 02 Sep 2019 03:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nS8SJeXGhED7VCvs6AE2mqLuzTzuAkWJ5ucpVp5/zVE=;
 b=lAwDCy+vUxdlGGJ3UvC5cDK3w4bb5XslR89HPn+YVOPPTwpEvZQBvz2W+q+gVM9NX+
 Xav+piSApe92TH4RYlnMLRhp4UV60XfhARdsPZYFy1uABQWi1LYaNAGgn6qQ61w0rZnf
 BkFQOwkOKQag7DwddNMPQ2b5egHayfYSWsy0I4l8lg0ah7So1qDnda3eRsVvHT3n/OVH
 +M+kcWs3kLEbLWAwVV4On+Eb6Pk2KhsGIySLB6fbyTAcyu4VZVnsVtVzoGoH8A1ov6Fd
 j20aPyHXeoFbUwNOPrUPX3u82cuA13XjHLbkCnKPGMZD0aw8rKEg/ZYXtggNHoBtAVKs
 l7Nw==
X-Gm-Message-State: APjAAAXMB5uzRhFA0kM7jStxyokWr7/T5OMmBj7xWvVMyoPZFIdCqdxj
 Lajp8hG89FwgLp1IyF4J/qLKROmM
X-Google-Smtp-Source: APXvYqzWxUg+i5OMp7PEB2PIeLioAvO9S32UEuwaBs+1L1u/xWykfXsGW7kvWmvHfr3/NZ9WtNqg7w==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr26170084wrs.315.1567421541195; 
 Mon, 02 Sep 2019 03:52:21 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c1c3:95e3:f9c6:800c])
 by smtp.gmail.com with ESMTPSA id t198sm22240861wmt.39.2019.09.02.03.52.20
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 03:52:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu: use moving fence instead of exclusive for VM
 updates
Date: Mon,  2 Sep 2019 12:52:17 +0200
Message-Id: <20190902105219.2813-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nS8SJeXGhED7VCvs6AE2mqLuzTzuAkWJ5ucpVp5/zVE=;
 b=HhIghqRJlkagWIcAJPRM1nZxWjoM8YLLd1ngWuYHistqDgqP7oisGsVTqCwpD2b5/4
 PAlRCqz5cger3AZ1M0n6bv1gZor5CNQ5s8yGI5SiJEAa2OEEJpGVO4tNDCDowspYdeMu
 A1XWFNHsVeedc4/qG7Bx8FPJaPFLzv8x9JAqS3AJfdf7dBDQOfG6qWFWObNpJWEWbmGp
 1Lzdw5qeBtoJF9W4yY7hlWuByhbli88QUVw11Uc6C3bR6XA4xGUTx/NQPHJwWMZDBvsW
 pNOYzgOv7d1JbKrqGDM9vOfv1Rge/HLP86kU5gY5mfQpJ1DEvVRATCWoIB28ujaqvL4L
 au6g==
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

TWFrZSBWTSB1cGRhdGVzIGRlcGVuZCBvbiB0aGUgbW92aW5nIGZlbmNlIGluc3RlYWQgb2YgdGhl
IGV4Y2x1c2l2ZSBvbmUuCgpNYWtlcyBpdCBsZXNzIGxpa2VseSB0byBhY3R1YWxseSBoYXZlIGEg
ZGVwZW5kZW5jeS4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKaW5kZXggMTg5YWQ1Njk5OTQ2Li41
MDFlMTM0MjA3ODYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCkBAIC0x
NzA2LDcgKzE3MDYsNyBAQCBpbnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAkJCXR0bSA9IGNvbnRhaW5lcl9vZihiby0+dGJvLnR0bSwgc3RydWN0IHR0
bV9kbWFfdHQsIHR0bSk7CiAJCQlwYWdlc19hZGRyID0gdHRtLT5kbWFfYWRkcmVzczsKIAkJfQot
CQlleGNsdXNpdmUgPSByZXNlcnZhdGlvbl9vYmplY3RfZ2V0X2V4Y2woYm8tPnRiby5yZXN2KTsK
KwkJZXhjbHVzaXZlID0gYm8tPnRiby5tb3Zpbmc7CiAJfQogCiAJaWYgKGJvKSB7Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
