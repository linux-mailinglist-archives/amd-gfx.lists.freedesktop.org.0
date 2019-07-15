Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF9569E08
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD7689E0C;
	Mon, 15 Jul 2019 21:25:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8079289DFE
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:03 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d17so17231133qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WkIjHW0SndoYfPc0q0KXjKClO/6Bi7FsjNkj0ue3qCo=;
 b=uaLo2XiPFvie+Zxkno1458Wo+AtU7PXje3EcxcIV0mXGgpul9zR99jokS46TXrA3bA
 BCA0T4lBtmrg3v6sYozEFyccEz1h5zqEW/ZJhebzAuzM2K1Gtx5Fhc440VOIQDe/3JLw
 ogAb6q9o4smG0c2PUDQtPsPEn6OXGj0rBT/4XxhffqeXUw027CWk+waJ68bcHwqfpEHO
 46B0OPf4ZcfxpWOHT5ldBfZNapYazr5ntlo+LT17kZBKg+Oz4lfuijJvLifDBbNDEvhb
 CO6tH6bo41UmkCwOKUYrsorxUeb5JiObtlflQWWuamYKg5yEjuobtS2sE8lbi2VoqjIr
 xpig==
X-Gm-Message-State: APjAAAVtWb+EbCUGDEUUo+NMS77MYR1rGrVBC+sVHSsHVv3ECTmTyp9n
 fnOi4q0iRFfmgFl9EJFGzmEg9oXl
X-Google-Smtp-Source: APXvYqxiuIxyYxv6yqqqKQnFOpKnhtT+sarPjsd0XmldXIYHbSqPSgCFQTLwBQHA2+Il4L8FOrBNUQ==
X-Received: by 2002:ad4:4a14:: with SMTP id m20mr20397230qvz.58.1563225901947; 
 Mon, 15 Jul 2019 14:25:01 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 019/102] drm/amdgpu: specify sdma instance 5~7 with second
 mmhub type
Date: Mon, 15 Jul 2019 16:23:14 -0500
Message-Id: <20190715212437.31793-17-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WkIjHW0SndoYfPc0q0KXjKClO/6Bi7FsjNkj0ue3qCo=;
 b=WOjh4FLvi8DIAGHmGfouMmPVvF69qEPpV8r49HuRx21oZbdANI2+6g3WhVjcpg6gJP
 nOGi1j8xvjt4AypcOt4snQ00f1dM4SkxmF1aMRAYoqKzWP23UpT4QIs+6MusgDUDE+FQ
 RA2QFkc2ZPZQyAxsDmA/0rb/tG38flRk/WQ+dZ4lqJNxtibzniynFCFiwPz+BqbGa192
 5XKCud3xb8m4oFFhMr28swUgwDRRFiudH8/OfFSL1BslhFrC57kJJCn8rFJ68+pQ0MSd
 J1buuz39WmlQTVe79VDgTkmgFbuFKxaVrFI7ElcnhDjyYWjAEl5o51ywi7g3iExrF8QE
 LyjQ==
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
Cc: Snow Zhang <Snow.Zhang@amd.com>, Le Ma <le.ma@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpPbiBBcmN0dXJ1cywgc2RtYSBpbnN0YW5jZSA1
fjcgaXMgY29ubmVjdGVkIHRvIHRoZSBzZWNvbmQgbW1odWIuIFRoZSB2bWh1YiB0eXBlCmluIGFt
ZGdwdV9yaW5nX2Z1bmNzIGlzIGNvbnN0YW50LCBzbyB3ZSBjcmVhdGUgYW4gaW5kaXZpZHVhbCBh
bWRncHVfcmluZ19mdW5jcwp3aXRoIGRpZmZlcmVudCB2bWh1YiB0eXBlKEFNREdQVV9NTUhVQl8x
KSBmb3IgdGhlc2Ugc2RtYSBpbnN0YW5jZXMuCgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KQWNrZWQtYnk6IFNub3cgWmhhbmcgPCBTbm93LlpoYW5nQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyB8IDQzICsrKysrKysrKysrKysr
KysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKaW5kZXggYjY1MDk1MjVm
NGZjLi4xZGNlOTc0ZTBjNTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NkbWFfdjRfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5j
CkBAIC0yMjEzLDYgKzIyMTMsNDIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmluZ19m
dW5jcyBzZG1hX3Y0XzBfcmluZ19mdW5jcyA9IHsKIAkuZW1pdF9yZWdfd3JpdGVfcmVnX3dhaXQg
PSBhbWRncHVfcmluZ19lbWl0X3JlZ193cml0ZV9yZWdfd2FpdF9oZWxwZXIsCiB9OwogCisvKgor
ICogT24gQXJjdHVydXMsIFNETUEgaW5zdGFuY2UgNX43IGhhcyBhIGRpZmZlcmVudCB2bWh1YiB0
eXBlKEFNREdQVV9NTUhVQl8xKS4KKyAqIFNvIGNyZWF0ZSBhIGluZGl2aWR1YWwgY29uc3RhbnQg
cmluZ19mdW5jcyBmb3IgdGhvc2UgaW5zdGFuY2VzLgorICovCitzdGF0aWMgY29uc3Qgc3RydWN0
IGFtZGdwdV9yaW5nX2Z1bmNzIHNkbWFfdjRfMF9yaW5nX2Z1bmNzXzJuZF9tbWh1YiA9IHsKKwku
dHlwZSA9IEFNREdQVV9SSU5HX1RZUEVfU0RNQSwKKwkuYWxpZ25fbWFzayA9IDB4ZiwKKwkubm9w
ID0gU0RNQV9QS1RfTk9QX0hFQURFUl9PUChTRE1BX09QX05PUCksCisJLnN1cHBvcnRfNjRiaXRf
cHRycyA9IHRydWUsCisJLnZtaHViID0gQU1ER1BVX01NSFVCXzEsCisJLmdldF9ycHRyID0gc2Rt
YV92NF8wX3JpbmdfZ2V0X3JwdHIsCisJLmdldF93cHRyID0gc2RtYV92NF8wX3JpbmdfZ2V0X3dw
dHIsCisJLnNldF93cHRyID0gc2RtYV92NF8wX3Jpbmdfc2V0X3dwdHIsCisJLmVtaXRfZnJhbWVf
c2l6ZSA9CisJCTYgKyAvKiBzZG1hX3Y0XzBfcmluZ19lbWl0X2hkcF9mbHVzaCAqLworCQkzICsg
LyogaGRwIGludmFsaWRhdGUgKi8KKwkJNiArIC8qIHNkbWFfdjRfMF9yaW5nX2VtaXRfcGlwZWxp
bmVfc3luYyAqLworCQkvKiBzZG1hX3Y0XzBfcmluZ19lbWl0X3ZtX2ZsdXNoICovCisJCVNPQzE1
X0ZMVVNIX0dQVV9UTEJfTlVNX1dSRUcgKiAzICsKKwkJU09DMTVfRkxVU0hfR1BVX1RMQl9OVU1f
UkVHX1dBSVQgKiA2ICsKKwkJMTAgKyAxMCArIDEwLCAvKiBzZG1hX3Y0XzBfcmluZ19lbWl0X2Zl
bmNlIHgzIGZvciB1c2VyIGZlbmNlLCB2bSBmZW5jZSAqLworCS5lbWl0X2liX3NpemUgPSA3ICsg
NiwgLyogc2RtYV92NF8wX3JpbmdfZW1pdF9pYiAqLworCS5lbWl0X2liID0gc2RtYV92NF8wX3Jp
bmdfZW1pdF9pYiwKKwkuZW1pdF9mZW5jZSA9IHNkbWFfdjRfMF9yaW5nX2VtaXRfZmVuY2UsCisJ
LmVtaXRfcGlwZWxpbmVfc3luYyA9IHNkbWFfdjRfMF9yaW5nX2VtaXRfcGlwZWxpbmVfc3luYywK
KwkuZW1pdF92bV9mbHVzaCA9IHNkbWFfdjRfMF9yaW5nX2VtaXRfdm1fZmx1c2gsCisJLmVtaXRf
aGRwX2ZsdXNoID0gc2RtYV92NF8wX3JpbmdfZW1pdF9oZHBfZmx1c2gsCisJLnRlc3RfcmluZyA9
IHNkbWFfdjRfMF9yaW5nX3Rlc3RfcmluZywKKwkudGVzdF9pYiA9IHNkbWFfdjRfMF9yaW5nX3Rl
c3RfaWIsCisJLmluc2VydF9ub3AgPSBzZG1hX3Y0XzBfcmluZ19pbnNlcnRfbm9wLAorCS5wYWRf
aWIgPSBzZG1hX3Y0XzBfcmluZ19wYWRfaWIsCisJLmVtaXRfd3JlZyA9IHNkbWFfdjRfMF9yaW5n
X2VtaXRfd3JlZywKKwkuZW1pdF9yZWdfd2FpdCA9IHNkbWFfdjRfMF9yaW5nX2VtaXRfcmVnX3dh
aXQsCisJLmVtaXRfcmVnX3dyaXRlX3JlZ193YWl0ID0gYW1kZ3B1X3JpbmdfZW1pdF9yZWdfd3Jp
dGVfcmVnX3dhaXRfaGVscGVyLAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmlu
Z19mdW5jcyBzZG1hX3Y0XzBfcGFnZV9yaW5nX2Z1bmNzID0gewogCS50eXBlID0gQU1ER1BVX1JJ
TkdfVFlQRV9TRE1BLAogCS5hbGlnbl9tYXNrID0gMHhmLApAQCAtMjI1MCw3ICsyMjg2LDEyIEBA
IHN0YXRpYyB2b2lkIHNkbWFfdjRfMF9zZXRfcmluZ19mdW5jcyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAlpbnQgaTsKIAogCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5zZG1hLm51bV9pbnN0
YW5jZXM7IGkrKykgewotCQlhZGV2LT5zZG1hLmluc3RhbmNlW2ldLnJpbmcuZnVuY3MgPSAmc2Rt
YV92NF8wX3JpbmdfZnVuY3M7CisJCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJV
UyAmJiBpID49NSkKKwkJCWFkZXYtPnNkbWEuaW5zdGFuY2VbaV0ucmluZy5mdW5jcyA9CisJCQkJ
CSZzZG1hX3Y0XzBfcmluZ19mdW5jc18ybmRfbW1odWI7CisJCWVsc2UKKwkJCWFkZXYtPnNkbWEu
aW5zdGFuY2VbaV0ucmluZy5mdW5jcyA9CisJCQkJCSZzZG1hX3Y0XzBfcmluZ19mdW5jczsKIAkJ
YWRldi0+c2RtYS5pbnN0YW5jZVtpXS5yaW5nLm1lID0gaTsKIAkJaWYgKGFkZXYtPnNkbWEuaGFz
X3BhZ2VfcXVldWUpIHsKIAkJCWFkZXYtPnNkbWEuaW5zdGFuY2VbaV0ucGFnZS5mdW5jcyA9ICZz
ZG1hX3Y0XzBfcGFnZV9yaW5nX2Z1bmNzOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
