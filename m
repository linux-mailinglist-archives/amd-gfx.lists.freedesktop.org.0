Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9AD5D783
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7486E086;
	Tue,  2 Jul 2019 20:29:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCFF6E082
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:39 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so28345qtk.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G5zDAV7eiPuES4z5C82t18sf2vK4ve6oKWwlB6Um+3E=;
 b=FUDtbN1cR2x/O0cUShF6KHO+HBbZGxWQlWeVtjvrDmTSJ6zi5c5qtikXVIMrRjXZ20
 MpCw+RnT+O5SbSlet9LMmPe/fmEfaJm2LBrYqcX3eUI7XkQc4fPLr3MAxFhYH71Xg/zg
 cseTovWQvXWe3+9fSqsI5jWyzesxwBzgbpJILyw0Db7XC3K43yUorj+8ECdqXYDVB3JI
 gfQXiXDZrJJq1rSVtk1nxkArrCgwvaVbHlUEo85eHR6vGGZNwgaJElhxfCMC1V9lZtkP
 AzztdH/EUJ7h0RxAwb6Fm2UGvtyHL1hdlUme/tEBxWMlGh27k5N4FQESDSAI7bbuUL7/
 PqMQ==
X-Gm-Message-State: APjAAAWXJXn1iJDSCFyTha0W2odETZi91KzKXBik3Iuc2+Wyg/QZuUG3
 1PddhpQQTTXxNh5ZFITZ/0MxoJH+2HQ=
X-Google-Smtp-Source: APXvYqwt+QeABmcxHUIGSUen624JYovD//OWcumax4e7DVuuwPATFS9m5t41uD9PbinXOY3jEyGbTQ==
X-Received: by 2002:ac8:1688:: with SMTP id r8mr26804042qtj.380.1562099378876; 
 Tue, 02 Jul 2019 13:29:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 49/53] drm/amd/powerplay: disable gfxoff for navi14
Date: Tue,  2 Jul 2019 15:28:40 -0500
Message-Id: <20190702202844.17001-50-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G5zDAV7eiPuES4z5C82t18sf2vK4ve6oKWwlB6Um+3E=;
 b=LcHgzxw2Fi2YejJLX9771Kyx5JMzyXikzK7Bw+qetpAJsMEhNKS0OOJ8LyUqqoDDnf
 t9fQQZFs9SBVOP7CpKmaMzNlAbEiAoeY3MdrVbyGbXGOE7Oq/UPqXPz98hdMF1FWzmJK
 7+39ljVvTVfiVerQy1Yx9IzCs4fLr71/l9ZRIMwQjDpXiNsYV2Fk44p4QDv9pm2cWPYo
 scvRywM9mJlQ+LnIxAfQq7/RCauJS0hIk7t3C1OQ5jsABYjEqJfRG5tVi+4YRQT6OOqC
 0Dhq+411tI+1g5UVNc+/RpESXX540fWsiIKGKFjZMVHlpxJOVKOc4RE3e9K2sR8PXE9z
 LdhA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCmdmeG9mZiBkb2Vzbid0
IHdvcmsgb24gbmF2aTE0IHlldCwgc28gZGlzYWJsZSBpdCBmb3Igbm93CgpTaWduZWQtb2ZmLWJ5
OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogSmFjayBY
aWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZGdwdV9zbXUuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IGE2YzIwMjdj
YjI3Zi4uYWY1OTM0NTNkZmM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1k
Z3B1X3NtdS5jCkBAIC01MzYsNiArNTM2LDkgQEAgc3RhdGljIGludCBzbXVfZWFybHlfaW5pdCh2
b2lkICpoYW5kbGUpCiAJc211LT5wbV9lbmFibGVkID0gISFhbWRncHVfZHBtOwogCW11dGV4X2lu
aXQoJnNtdS0+bXV0ZXgpOwogCisJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX05BVkkxNCkK
KwkJYWRldi0+cG0ucHBfZmVhdHVyZSAmPSB+UFBfR0ZYT0ZGX01BU0s7CisKIAlyZXR1cm4gc211
X3NldF9mdW5jcyhhZGV2KTsKIH0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
