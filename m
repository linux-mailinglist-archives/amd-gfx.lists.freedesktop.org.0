Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E06D087E99
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E309B6EE44;
	Fri,  9 Aug 2019 15:53:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AD66EE40
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:21 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id r4so71879840qkm.13
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YdftKCKSFdQRWolyf7enRIqc9mVBABxoL1xfAAAtIkM=;
 b=K5scX3zjreJBAbxXr9pmTsjajufkm3wQMbY6DDJwK1ZWEOFNE0J8kLVmE1rxGOENcP
 h/D29Mh/p/oB8wl+hozJvzgo2sdPwm6MubCfqpQQe6CRXLGYR6iXG/e6Q1jVB5HnI7t4
 DfcoqwSvGCxgnD6V64QL8hkGQgBdKimbxnlcnwUmio7ytlwC7meK9BuRga4mJbNDyGEU
 V9rQ1VQkxQ6OvcvUqzZ8nGTi9Dbyw2H0ZIf/kx5jGMyEh8yLhgGyFFf6/Zjc2zEqVf2p
 iy8r77YlL3h2nvFzWQrPZjyO4itNMuPXIMTw61Cx6goO62vuEIZ8+1rccfjDI8Q6cN5j
 9Qig==
X-Gm-Message-State: APjAAAV5QunoPHfDZ8/9x9gqm4SbiaPbXiTUP4lHxiHbHnvAr2OcouXz
 Q+7WbXoFWz2dbRs0vN/tumVOEbL5
X-Google-Smtp-Source: APXvYqyapQJIFqE54LAXIeQsZpvxlPlxLsAZtb8Zz7uprhTU4FM8Evt8je7kqQmQcjqg1bl5obL73w==
X-Received: by 2002:a05:620a:13d1:: with SMTP id
 g17mr11244149qkl.499.1565366000401; 
 Fri, 09 Aug 2019 08:53:20 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 12/27] drm/amdgpu: enable dce virtual ip module for Renoir
Date: Fri,  9 Aug 2019 10:52:47 -0500
Message-Id: <20190809155302.4733-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YdftKCKSFdQRWolyf7enRIqc9mVBABxoL1xfAAAtIkM=;
 b=UxpbJtv9QSdyAG2jDtRvISj6kYl8TwhIDu6LeAEYxftXMhXP+sSdHtHQkCJYyPyVnp
 iu08ou6XEKFagNq84BvMXTleiUlXfHEUkkLBZKy0sQ0E1+oaaoU3e80QDH/4jU58Qm3k
 g18hMNkmArKYpBsE+H/ORofGgSMVHqKpnOA1e4uoYPL4aSJCHw+5cGvTOMYQgKvOPSai
 lndQXZ/0D+NlE734pCuOhSvk1v4/vDqVRgTvwSDiM7gVOa+EMe4qHI9qScLmLdOG3VmF
 /K7PGpB2GTDQeUbnfeI21rBcMwIwfVqhndYQx44Z8jjw0xR3y+rIWDLOAVSHO/VuJG8g
 pIYA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6IEFhcm9u
IExpdSA8YWFyb24ubGl1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFu
Z0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYyB8
IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyAgICAgICB8IDIgKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2RjZV92aXJ0dWFsLmMKaW5kZXggYzgxZDdhMjA2N2FkLi42ZGFkYmVkN2NlNDMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92aXJ0dWFsLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYwpAQCAtNDU2LDYgKzQ1Niw3IEBAIHN0
YXRpYyBpbnQgZGNlX3ZpcnR1YWxfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJY2FzZSBDSElQX1ZF
R0ExMjoKIAljYXNlIENISVBfVkVHQTIwOgogCWNhc2UgQ0hJUF9BUkNUVVJVUzoKKwljYXNlIENI
SVBfUkVOT0lSOgogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJY2FzZSBDSElQX05BVkkxNDoKIAljYXNl
IENISVBfTkFWSTEyOgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29j
MTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggOGJkMzA5ZTlk
MTcxLi5lZWMyOGVmODEyOWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NvYzE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAtNzQ5
LDYgKzc0OSw4IEBAIGludCBzb2MxNV9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmdmVnYTEwX2loX2lw
X2Jsb2NrKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmdmeF92OV8wX2lw
X2Jsb2NrKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNkbWFfdjRfMF9p
cF9ibG9jayk7CisJCWlmIChhZGV2LT5lbmFibGVfdmlydHVhbF9kaXNwbGF5IHx8IGFtZGdwdV9z
cmlvdl92ZihhZGV2KSkKKwkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZkY2Vf
dmlydHVhbF9pcF9ibG9jayk7CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCXJldHVybiAtRUlOVkFM
OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
