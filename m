Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE60469E22
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9557D89EEB;
	Mon, 15 Jul 2019 21:25:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C951789EB8
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:26 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d23so17287675qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FkxKSI1iuexmiNAf4I37LBRtflP6JzdQgsJIOT3IPuA=;
 b=F0Tv85P4K/GD/ZC6FvW69DzB3f/8yOSLJrdIf/GSq21ieKB3b4zSrznJVPqjKkl+qF
 oI3uKjKF+E+6ZyzNeCEYNp/X1ij2hDpbdcRIyvOQpqiWGRpN/aSzz8lkWy6TA/03FyXX
 sbh4PmX0Jd986hKjejXyrR2gWHFoKjIN7noXagKrbmrZ2fB1fxSwc9olNkhZEbJZJV6q
 SnvSyL/R/C5sMihfnau93W0+6p8WEKXwjF19e+OZfo73vSdlO/+5wPa5k2gzgkMy4T5I
 L9XSlNVne7xo+t6cxEwoluov7JfnCqAd7ozUghezKkW18qmkp9I9pbMP5yKaU5bHf+/1
 yNfg==
X-Gm-Message-State: APjAAAW007iOoKlklZfET9/EPNLCkgXv8DNO0kR06r8VVeWeogNQMhc0
 kEbK8ifTisQxIJ7gIU9LLgNc+H48
X-Google-Smtp-Source: APXvYqw0HFIWSvtPX5TxYh2d8RsGmo/pi81K7NnJJqk3vbookBvGGfnKHGbGF4+AEwK/zXa7LcarZQ==
X-Received: by 2002:ac8:41d1:: with SMTP id o17mr19911284qtm.17.1563225925737; 
 Mon, 15 Jul 2019 14:25:25 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 046/102] drm/amdkfd: Support two MMHUBs when setting up page
 table base in KFD
Date: Mon, 15 Jul 2019 16:23:41 -0500
Message-Id: <20190715212437.31793-44-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FkxKSI1iuexmiNAf4I37LBRtflP6JzdQgsJIOT3IPuA=;
 b=GKRfORHVch+IRxIqU2E/x5n/yjwZjWRhZRu4SQw2h4jJpoYTpkuU1wNcCPFr31D4x3
 21XTUGj2HoQBFXCI5aa63Oh6opxXNaliDjwnEb/aZVE8gP957XJU+JnIjZ5jy9Jj0R5+
 qge1quifpu9TskOEF3Cl6T7XNZRrVwkPyXmvK9PuUuF7x/LVICFXli1FG3MTHh6mxtt7
 iFFR13+2/+EeHen/rZwXYxWf5sYM8qzePZ8A2FKwa985wm6A2a5Lyb2VhE4wFkYDuUvZ
 X/eQKuo3dM5NI1chUE1d6B7qho8SujgTm/iquzp0hhNWa37GDvlWMLlSTJmjbR+FEjGw
 yhtQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Yong Zhao <Yong.Zhao@amd.com>,
 Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6IFlvbmcg
WmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVu
Z0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9n
ZnhfdjkuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkX2dmeF92OS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZF9nZnhfdjkuYwppbmRleCBkNWFmNDExNDNkMTIuLmY1MzE0MDIyM2M3NyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjkuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92OS5jCkBAIC00
Nyw2ICs0Nyw3IEBACiAjaW5jbHVkZSAic29jMTVkLmgiCiAjaW5jbHVkZSAibW1odWJfdjFfMC5o
IgogI2luY2x1ZGUgImdmeGh1Yl92MV8wLmgiCisjaW5jbHVkZSAiZ21jX3Y5XzAuaCIKIAogCiAj
ZGVmaW5lIFY5X1BJUEVfUEVSX01FQwkJKDQpCkBAIC04ODQsNyArODg1LDEyIEBAIHN0YXRpYyB2
b2lkIHNldF92bV9jb250ZXh0X3BhZ2VfdGFibGVfYmFzZShzdHJ1Y3Qga2dkX2RldiAqa2dkLCB1
aW50MzJfdCB2bWlkLAogCSAqIG5vdywgYWxsIHByb2Nlc3NlcyBzaGFyZSB0aGUgc2FtZSBhZGRy
ZXNzIHNwYWNlIHNpemUsIGxpa2UKIAkgKiBvbiBHRlg4IGFuZCBvbGRlci4KIAkgKi8KLQltbWh1
Yl92MV8wX3NldHVwX3ZtX3B0X3JlZ3MoYWRldiwgdm1pZCwgcGFnZV90YWJsZV9iYXNlKTsKKwlp
ZiAoYWRldi0+YXNpY190eXBlID09IENISVBfQVJDVFVSVVMpIHsKKwkJLyogVHdvIE1NSFVCcyAq
LworCQltbWh1Yl92OV80X3NldHVwX3ZtX3B0X3JlZ3MoYWRldiwgMCwgdm1pZCwgcGFnZV90YWJs
ZV9iYXNlKTsKKwkJbW1odWJfdjlfNF9zZXR1cF92bV9wdF9yZWdzKGFkZXYsIDEsIHZtaWQsIHBh
Z2VfdGFibGVfYmFzZSk7CisJfSBlbHNlCisJCW1taHViX3YxXzBfc2V0dXBfdm1fcHRfcmVncyhh
ZGV2LCB2bWlkLCBwYWdlX3RhYmxlX2Jhc2UpOwogCiAJZ2Z4aHViX3YxXzBfc2V0dXBfdm1fcHRf
cmVncyhhZGV2LCB2bWlkLCBwYWdlX3RhYmxlX2Jhc2UpOwogfQotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
