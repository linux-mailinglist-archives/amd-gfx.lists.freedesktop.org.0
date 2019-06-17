Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB9A48DEF
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE99B893ED;
	Mon, 17 Jun 2019 19:17:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D55C893ED
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:51 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x47so12136539qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DVglVmAW1PEyXZ2z0Po26YbNjIbTsyx4g75XJlWzpQU=;
 b=YLVhSOSa7s6FNoQ3PaFA/Aan3cnX1ceBipQGoCfJdoIhqCbhLgvbBj1nndBhKfGem5
 egCQXLGfn0FCBfEpET2VCZd3JtjYsIqAxITiqUY3AGouRWZclu58aQDlYEwTyBolDyRI
 nh9fCN0zMPSbFoQrYF4wfcBr+GdUCOw4sxN7xnoVWbhFiJMpsMlsIhRDDa7XAiBVKz11
 u+HuwBwowbqTuHSyS0+OGiXkSHg3aZiQnWgoGr2fByqTQqxUgd3LlcTA4kkq8gofFJxf
 lbNac8R9UgN5+bHekP77jEW0V3343BG6OayXsxA2NSTkCAxtWdB30sAbvT+0ySXsGzNC
 3LvQ==
X-Gm-Message-State: APjAAAXESYvMHQm1Qa6e7lNVFW2axnih1gXVjGwrNZYBYqzTvDxOFd7E
 k4kmOKpTalERNYYL34KOKMKtpUXyGro=
X-Google-Smtp-Source: APXvYqwzPXRkvGmuvcxLThz+hgwlWcBUs8xdfFm27ds67rAfsWdf8z1SEDx25IWBTQlKJsRCYOnq3w==
X-Received: by 2002:ac8:42d4:: with SMTP id g20mr96013293qtm.78.1560799070212; 
 Mon, 17 Jun 2019 12:17:50 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 048/459] drm/amdgpu: add new HDP CG flags
Date: Mon, 17 Jun 2019 14:10:09 -0500
Message-Id: <20190617191700.17899-37-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DVglVmAW1PEyXZ2z0Po26YbNjIbTsyx4g75XJlWzpQU=;
 b=NNdp1i3yIHcHwTpNER8gQ/IDI/SOm2taoKq/62Ib/plrG42+CF4l0xIu4t90xJsaY1
 Q1mxhgTgg0L+xO4KBpfimylE4Z2l5TEmx3QaXet8kMLFHMRp7gvU5vv329qNN4XQfjGV
 7+OSLaoyOCfGqUcT6CgVkyVOYAA/kGL+ZHFBLoeWEnpb2jmuoQI4nFfK4cJlo6sckO46
 aL2j+k9dEWD4uh6OZgJmJL4DRbaGyN0KdRItpfiOJ0egzJpcJAbpGWJj+n+B4eBnXjZ5
 91QSZoQ/Ikz54jf3FG4cKpCKgx/I7E/uNrA2yzZmxdwH2e1ez4UdXP2vnk36OGtp6jQt
 Ka0g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKSERQIDUuMCBzdXBw
b3J0cyBTUkFNIHBvd2VyIGdhdGluZy4gYWxsIHRoZSBMUyAoTGlnaHQgU2xlZXApLwpEUyAoRGVl
cCBTbGVlcCkvU0QgKFNodXQgRG93bikgbW9kZXMgYXJlIHN1cHBvcnRlZC4gSG93ZXZlciwKb25s
eSBvbmUgb2YgdGhlc2UgbW9kZXMgY2FuIGJlIGVuYWJsZWQgYXQgb25lIHRpbWUuCgpUaGVyZSBp
cyBubyBkeW5hbWljIHBvd2VyIG1vZGUgc3dpdGNoIHN1cHBvcnQuIGNsb2NrL3Bvd2VyIGdhdGlu
ZwpoYXMgdG8gYmUgZGlzYWJsZWQgYmVmb3JlIG1ha2luZyBhbnkgcG93ZXIgbW9kZSBjaGFuZ2Uu
CgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oIHwgMiArKwogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
aW5jbHVkZS9hbWRfc2hhcmVkLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3No
YXJlZC5oCmluZGV4IDU3NGJmNmU3MDc2My4uYWJmMDQ1NGIxYTlkIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmgKQEAgLTkzLDYgKzkzLDggQEAgZW51bSBhbWRfcG93
ZXJnYXRpbmdfc3RhdGUgewogI2RlZmluZSBBTURfQ0dfU1VQUE9SVF9EUk1fTUdDRwkJCSgxIDw8
IDIyKQogI2RlZmluZSBBTURfQ0dfU1VQUE9SVF9ERl9NR0NHCQkJKDEgPDwgMjMpCiAjZGVmaW5l
IEFNRF9DR19TVVBQT1JUX1ZDTl9NR0NHCQkJKDEgPDwgMjQpCisjZGVmaW5lIEFNRF9DR19TVVBQ
T1JUX0hEUF9EUwkJCSgxIDw8IDI1KQorI2RlZmluZSBBTURfQ0dfU1VQUE9SVF9IRFBfU0QJCQko
MSA8PCAyNikKIC8qIFBHIGZsYWdzICovCiAjZGVmaW5lIEFNRF9QR19TVVBQT1JUX0dGWF9QRwkJ
CSgxIDw8IDApCiAjZGVmaW5lIEFNRF9QR19TVVBQT1JUX0dGWF9TTUcJCQkoMSA8PCAxKQotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
