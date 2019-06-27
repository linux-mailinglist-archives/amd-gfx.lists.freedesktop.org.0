Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE278583D5
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 15:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273E96E41F;
	Thu, 27 Jun 2019 13:51:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3BB6E36D
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 13:51:12 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id i125so1744579qkd.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 06:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3oe8n+oGzEML8w3Hm0gzZ8ZK5eceuKys6cdGB7rg/xY=;
 b=HNeLL5YM5a7BTGVkP2mpxGCNsDuTdDv71Zw/HjZ+1uVfnmdf3O1TUeG/thGLa5Mrw3
 zmtqaQU/LxtrKTTVCKUFpCQtSqID6CvsoneRtbUf/qrXei6p+FxU2XGGNbxJlSUHuiKa
 pF+6I3yvMFC+IZgFjTocoAIc/Q19Wj59Yu63en4qLvnVWXgQL4zuCa0br/+U6PC5PxjG
 uCO8TfbjWBf61FiYfIxFvRPLAvD0czuMEXWuvzsdAxZe4uP3yA7exHhdLDg0e86jVRxG
 4A2xan4XzG4i+nak+Jv0hDFJvAjaDXJ7u0b5byaoZ4jSVGe4vUqD4Ow9sX6K8x71Z9GH
 U2vA==
X-Gm-Message-State: APjAAAUvMFoX/yX/IXwXTec46stMaLY1hizYbrcR05gw/h9pPzkms0hO
 ro6eLr3qN6rWM1Rjg5nVnq06gnRyFmg=
X-Google-Smtp-Source: APXvYqyAJYvMT+KpF8yoqOXxKN9BMYf6rizQCyWGM2lhl8KUQWZLRnUb4EEx/kVd/+UxNXoMHSun6Q==
X-Received: by 2002:a37:4d82:: with SMTP id a124mr3406311qkb.72.1561643471332; 
 Thu, 27 Jun 2019 06:51:11 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id r40sm1007067qtr.57.2019.06.27.06.51.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 06:51:10 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix warning on 32 bit
Date: Thu, 27 Jun 2019 08:50:58 -0500
Message-Id: <20190627135058.10947-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3oe8n+oGzEML8w3Hm0gzZ8ZK5eceuKys6cdGB7rg/xY=;
 b=JghvvvEdAX5oi3UPnC0XsSd8VKvrgz+uZvRHYuPM/KqUx///LMqU6bAoFqmQso/Xj7
 IpYqj68HriP/ShWzRz/8W6gBVzIMkulmkjSUh1f5sMal+6AiIhXdvBHO4U0vN52bGVLc
 DTjmaeuLQSskKwMlaWhchvhOr1nUgesUWq99GQzJKAaFAnVlgWq0HSVm3VfgZgqHRT3G
 FeZZj4frrjGPlNqMB0liyGdqmCJgKPvfWSoJ8jvchUXVTx/MIkBlMT8LbKRAPzEmWoPD
 1YW+n66CoDmdtGi+sUQfifnYEWsH9w1aGCSBzJ3aKlXB00279wZk9j9mnv9KXZVA/0RF
 JHKQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UHJvcGVybHkgY2FzdCBwb2ludGVyIHRvIGludC4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS92Y25fdjJfMC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3Zjbl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCmluZGV4
IGM0NDFlNmNlOTVlYy4uOTg4YzBhZGFjYTkxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS92Y25fdjJfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zj
bl92Ml8wLmMKQEAgLTEwMTAsOCArMTAxMCw4IEBAIHN0YXRpYyBpbnQgdmNuX3YyXzBfc3RhcnRf
ZHBnX21vZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgaW5kaXJlY3QpCiAKIAlp
ZiAoaW5kaXJlY3QpCiAJCXBzcF91cGRhdGVfdmNuX3NyYW0oYWRldiwgMCwgYWRldi0+dmNuLmRw
Z19zcmFtX2dwdV9hZGRyLAotCQkJKHVpbnQzMl90KSgodWludDY0X3QpYWRldi0+dmNuLmRwZ19z
cmFtX2N1cnJfYWRkciAtCi0JCQkodWludDY0X3QpYWRldi0+dmNuLmRwZ19zcmFtX2NwdV9hZGRy
KSk7CisJCQkJICAgICh1aW50MzJfdCkoKHVpbnRwdHJfdClhZGV2LT52Y24uZHBnX3NyYW1fY3Vy
cl9hZGRyIC0KKwkJCQkJICAgICAgICh1aW50cHRyX3QpYWRldi0+dmNuLmRwZ19zcmFtX2NwdV9h
ZGRyKSk7CiAKIAkvKiBmb3JjZSBSQkMgaW50byBpZGxlIHN0YXRlICovCiAJcmJfYnVmc3ogPSBv
cmRlcl9iYXNlXzIocmluZy0+cmluZ19zaXplKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
