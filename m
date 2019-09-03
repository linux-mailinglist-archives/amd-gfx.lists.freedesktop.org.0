Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9BCA64B8
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 11:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D638951B;
	Tue,  3 Sep 2019 09:09:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B195B89503
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 09:09:08 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c3so16579947wrd.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Sep 2019 02:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nS8SJeXGhED7VCvs6AE2mqLuzTzuAkWJ5ucpVp5/zVE=;
 b=A6aKTZBAa7TOyIbuyT1k79qTycbUh0cvykoqmVxLIRNCq78yc4kmidHvUqbR/VUv41
 mebmhJSmxRytE7j78sXKhrx7g+17ti0y6DHxpCD5d+c3lkIfw2ZsSGCIHmF65l02TrcN
 HO5K+SCRKWeviT/z0eVrTqs3ivxbe1SArGFQj9OBihiQmIoyeHIPv//A0fCE6o3lelPF
 LY7EmemfEwhUQvghldrzKFCX+u7CiM0rA9KCDQtD+Sev8PDhb8CoIjqTKlBb0H76DCZu
 v4Mq98t7kvIcY7SWSJGn8se3ZKa6XVxIcqVCmEb0VaU1+IoEo3zDKF3zL/0qW36m8mIb
 O0zw==
X-Gm-Message-State: APjAAAU+5tXWZglYI2iAfScFBNdsE9OrMBoVoXIMjHXi5WqaBkNUdime
 TjVlcfUgawvnlVEeNYrJ9cd26dmy
X-Google-Smtp-Source: APXvYqyw9uzI5VNEQn/VH/HRzZOT1ytL2pMRnokAdKgpT3iD4LsOk2VALZdE3YRLalPF/80JC19rEg==
X-Received: by 2002:adf:f486:: with SMTP id l6mr26344824wro.232.1567501746483; 
 Tue, 03 Sep 2019 02:09:06 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:9851:779a:613a:c00d])
 by smtp.gmail.com with ESMTPSA id i93sm24132416wri.57.2019.09.03.02.09.05
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 02:09:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu: use moving fence instead of exclusive for VM
 updates
Date: Tue,  3 Sep 2019 11:09:02 +0200
Message-Id: <20190903090904.30747-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nS8SJeXGhED7VCvs6AE2mqLuzTzuAkWJ5ucpVp5/zVE=;
 b=NZNorjngloFFPBocBrrJ9XwOhjpG8p4QqWO8A6v0E2lpa34EPvSFb/pY9jkdIvRHB7
 OO7az3ZGr27iEQ8Ixsi0OuTkgoIX/sZxd33Q+Um3TbwE2KiXrxjNkwsRkVhtjORjQFVx
 crv1+o7dT0TRDnVDgQy8nEc6hoIJ3VDfEYxEnLIkvK/J40WHPpK0LgT0EBAmxWMJlYPF
 6HaiA9RphLRsdGw3GtOJwduDfb2eNUTqiPIJGWhLTl0LMQycjR6GoB7LnjZbRweApu5C
 9fRBshRJV78AyNLjQXIrC1joD9mszEeigmZGEqfHlFDqWWErRQ+mHE5/zWyHC7oY1VkV
 0Mog==
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
