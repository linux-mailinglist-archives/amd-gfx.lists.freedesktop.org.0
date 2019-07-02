Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AFD5D774
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FCC6E06E;
	Tue,  2 Jul 2019 20:29:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E0C6E06E
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:29 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id w17so20139800qto.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pU1iaFwJMgtzM+cKQV9DHUfPJd7KeLMex/iSza02Vgc=;
 b=kk6M3RzF4plVDG0o2dL6BlYzgXmhL10QToPUnNMIwVnPIZ5DWl2uDei/UtXpGSX2jJ
 MO3XdDv4wTPeY8moe01lC+9yNxPBQIoar+Ok4tOT8LCUkVEdMjnNDasfcWoOW9sFMOlY
 rwuCkCEpDjPlhyfeIka93/mzRwJCFYDET7kym/S38bvaKQszibThW5LbrXv+QrMTCn87
 xsO9HCj9megnc/IY4p15ErJPr1t3j3891awOfGCqfbAz8qVGSS0hulqZMnNkZ+gts/4P
 Xpa0bZe6nyRIcKL3o+xaWiy2j7iLSRXwzbVDFakWbhnEm5glU31c17J0Jsr9aVYNEg4z
 PyXw==
X-Gm-Message-State: APjAAAXE6D+rxMTIZPGLS0Q+MLlowh0APAx1cekguRJnYq8eeykJRPfD
 tyfzeVJUyMwouHzusGjLEsu+0TdJk4A=
X-Google-Smtp-Source: APXvYqzcHkC2mGW1EQz081S8comEoiCRYCCahdUROME2H8uuftz4RCMtyKQ0n52DQbpGebtsSo9tIw==
X-Received: by 2002:a0c:a8d1:: with SMTP id h17mr28042998qvc.117.1562099366398; 
 Tue, 02 Jul 2019 13:29:26 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 35/53] drm/amd/display: add nv14 cases to amdgpu_dm
Date: Tue,  2 Jul 2019 15:28:26 -0500
Message-Id: <20190702202844.17001-36-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pU1iaFwJMgtzM+cKQV9DHUfPJd7KeLMex/iSza02Vgc=;
 b=B4t2tMEB3q81y18W3UYV03pQjya3pMe+s3a6f0P8FBpf5CqfGDbKT8pG0HFEs+ZHtz
 TrX3BmdJi6xbt6hXQPb/IgqNY68cN19uTPlYm79PSUtZ6686QaWLMm1e5W54GH5HEcuw
 jaPqyklafSdHWtLiiV3s1EqbY2mwys7wjbJFmpIEsC+Jpr4VvB8gEaUcBuMRKd9IiqFy
 8E5zpoi7PnwM4yWcXkxtIGML/s51sVdfEOEoqDkiOD1PuEIL4nR62NFscvXiLCLTbL+D
 h9o7S+ETWAD6/F3AhwCbK5+C5qqMucLIhKBaNmbmEWuUSy76gMXOr6haCuOOPN0WvSkr
 WIrA==
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
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CgpNb3N0
bHkgc2hhcmVkIHdpdGggbmF2aTEwLgoKU2lnbmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFraGEg
PEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMKaW5kZXggYmU1YTU2MTBjMTY1Li44MzdkZGRiZGI5NjcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtMjIx
NCw2ICsyMjE0LDcgQEAgc3RhdGljIGludCBhbWRncHVfZG1faW5pdGlhbGl6ZV9kcm1fZGV2aWNl
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWNhc2UgQ0hJUF9SQVZFTjoKICNpZiBkZWZp
bmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMCkKIAljYXNlIENISVBfTkFWSTEwOgorCWNhc2Ug
Q0hJUF9OQVZJMTQ6CiAjZW5kaWYKIAkJaWYgKGRjbjEwX3JlZ2lzdGVyX2lycV9oYW5kbGVycyhk
bS0+YWRldikpIHsKIAkJCURSTV9FUlJPUigiRE06IEZhaWxlZCB0byBpbml0aWFsaXplIElSUVxu
Iik7CkBAIC0yNDQ3LDYgKzI0NDgsMTEgQEAgc3RhdGljIGludCBkbV9lYXJseV9pbml0KHZvaWQg
KmhhbmRsZSkKIAkJYWRldi0+bW9kZV9pbmZvLm51bV9ocGQgPSA2OwogCQlhZGV2LT5tb2RlX2lu
Zm8ubnVtX2RpZyA9IDY7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9OQVZJMTQ6CisJCWFkZXYtPm1v
ZGVfaW5mby5udW1fY3J0YyA9IDU7CisJCWFkZXYtPm1vZGVfaW5mby5udW1faHBkID0gNTsKKwkJ
YWRldi0+bW9kZV9pbmZvLm51bV9kaWcgPSA1OworCQlicmVhazsKICNlbmRpZgogCWRlZmF1bHQ6
CiAJCURSTV9FUlJPUigiVW5zdXBwb3J0ZWQgQVNJQyB0eXBlOiAweCVYXG4iLCBhZGV2LT5hc2lj
X3R5cGUpOwpAQCAtMjc0Miw2ICsyNzQ4LDcgQEAgZmlsbF9wbGFuZV9idWZmZXJfYXR0cmlidXRl
cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkgICAgYWRldi0+YXNpY190eXBlID09IENI
SVBfVkVHQTIwIHx8CiAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzApCiAJICAg
IGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX05BVkkxMCB8fAorCSAgICBhZGV2LT5hc2ljX3R5cGUg
PT0gQ0hJUF9OQVZJMTQgfHwKICNlbmRpZgogCSAgICBhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9S
QVZFTikgewogCQkvKiBGaWxsIEdGWDkgcGFyYW1zICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
