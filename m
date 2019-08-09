Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4667D87EA8
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8812D6EE54;
	Fri,  9 Aug 2019 15:53:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31B16EE4A
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:34 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id g18so725983qkl.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7KL7VIRquhRuAcPNeLxva6njPnBfKPj3gXf4rqtTY5s=;
 b=MNHdMAnSXmgyN6+OmxSHTAjqsk2/Mlds6uJdK9nuvpN9VswGubvbeyeF9NMlQrjyBy
 es8oP2G9QvrzzBhqkO2zmlH1COFy8a3bXk5JYspEfHuU3v4OgWVPlqhAxD9lJVpDwfO9
 t9QkSGLTY804tbe0QvEg/MPZoj7Ox+U/pDMINfsXtf9X22ONm7eI0Kbn51x05YhHv8VI
 n+CiXdiqHboa00jmK0URDkKlMFHbQ2I64Pv+dJOsvNPp4ibXMGHGKXfDIMNS0MFtuV/A
 JtUpw62aonamCwXSB7kWTkvuJN5C5i1qYyUl/8NPNaizXwGDOjE0vZjfrWr1SUn8QEiz
 3iPw==
X-Gm-Message-State: APjAAAVpzY1Yhj6SHMO6qbrW/W/qwwSKhfP0HytL1uyUHPULfDyzURCw
 aHoPXQN3XRCw1JGaGoHlZFFbgteI
X-Google-Smtp-Source: APXvYqwOTYL2hsVhIVu4BmxAHRycIEIcdHJaoBQ1/P9IICsecXTh+7WYaGKAthlq0RBFNp6/PPYsqA==
X-Received: by 2002:a37:5f82:: with SMTP id
 t124mr17428753qkb.180.1565366013468; 
 Fri, 09 Aug 2019 08:53:33 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 26/27] drm/amdgpu: skip mec2 jump table loading for renoir
Date: Fri,  9 Aug 2019 10:53:01 -0500
Message-Id: <20190809155302.4733-26-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7KL7VIRquhRuAcPNeLxva6njPnBfKPj3gXf4rqtTY5s=;
 b=VKYr7xjGHyhhrP7tD2Qj42i3h+GPMlzzkfCLfCCChXwkuJ9O0liTqyw56FUMb9SH/d
 H+8LJlHCEQxccvfZcHKrfG/gFgHpZMWA5sHK/ohFyDNRlWa2cXgJCrkw/a300HJg7/39
 1RXD2cpVfOlJ0LDCdjFtvT2lXRbznN2KWLl0YZcKp13dNl0yhkPXc8mibXH/06OQhKVE
 ivLnyY4qxvBz/mL4ZEs7+r0epaB4LFC5dU2eWD1FuDcnZS9nUoyZzuTEe5uMZhoGBx0t
 Sn2GTJcheGMq9EbOfk/tmc9VDFeIURPJJjIo7qMvR4YLdEiAQGtD6WCTaBkb54Fx5XYH
 pzkg==
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

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClJlbm9pciBuZWVkIG5vdCBsb2Fk
IG1lYzIganVtcCB0YWJsZSB3aXRoIHBzcC4KClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5
Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBYXJvbiBMaXUgPGFhcm9uLmxpdUBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIHwgNCArKysrCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5jCmluZGV4IDRiYzhiNTM3Nzc1NS4uYWFhNGNkZjhiY2FlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCkBAIC0xMDIzLDYgKzEwMjMsMTAgQEAgc3Rh
dGljIGludCBwc3BfbnBfZndfbG9hZChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKIAkJICAgICB1
Y29kZS0+dWNvZGVfaWQgPT0gQU1ER1BVX1VDT0RFX0lEX0NQX01FQzJfSlQpKQogCQkJLyogc2tp
cCBtZWMgSlQgd2hlbiBhdXRvbG9hZCBpcyBlbmFibGVkICovCiAJCQljb250aW51ZTsKKwkJLyog
UmVub2lyIG9ubHkgbmVlZHMgdG8gbG9hZCBtZWMganVtcCB0YWJsZSBvbmUgdGltZSAqLworCQlp
ZiAoYWRldi0+YXNpY190eXBlID09IENISVBfUkVOT0lSICYmCisJCSAgICB1Y29kZS0+dWNvZGVf
aWQgPT0gQU1ER1BVX1VDT0RFX0lEX0NQX01FQzJfSlQpCisJCQljb250aW51ZTsKIAogCQlyZXQg
PSBwc3BfZXhlY3V0ZV9ucF9md19sb2FkKHBzcCwgdWNvZGUpOwogCQlpZiAocmV0KQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
