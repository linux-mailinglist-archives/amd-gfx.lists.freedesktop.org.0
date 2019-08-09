Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE6687E8F
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582436EE38;
	Fri,  9 Aug 2019 15:53:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AEE6EE38
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:13 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id v38so3864086qtb.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oVUgzXLi2r1xRSJkQhHpfQUojkGLwovxVapOwiHujj8=;
 b=i2ivA4k40X/x9jrsUhuOak2gR3nJmDBgeS79a2CdX4BJkWweLcurhkVo5xVY7flMJY
 kjerGuyVwn121m05lMpwZb0Z0aQatFnD2yrFAX5FwyW4h3WwTOZjr09ADUOZV5slpyoN
 wqxUHY88ZyIiZiikt5inmlYbpMCFSS7ywYHetzAqtd31Eal7OpinjSRLWNnaYuo5P86V
 y5QgFuXcRDfyI6ofikXYX+ovYMenc2kGbFp82/2i80jMMqzfImyDX54J/BH7Q8T/4wz7
 /iWLzxLSt9QDGXrEY/8U6P8Kg1xEgAcRgVWSBNVG9jHXOGWlf3w+lTzgfpkX+7FZjdDy
 dwPw==
X-Gm-Message-State: APjAAAU0NIRg1Ke8FNGZroKxP51A3W8SmLTwamaT+LAI75Q1GvX/U7Tm
 dVJN5TNC37DBKHYDJx9lXAaJ0Rj3
X-Google-Smtp-Source: APXvYqwhpJQae6hEDRbU6LyAgQ0jgHozBvwv8U8rDLrfHQPOlaFX+GhKuXytUldH10rY1BG5bWjIDQ==
X-Received: by 2002:a0c:8910:: with SMTP id 16mr18789611qvp.55.1565365992428; 
 Fri, 09 Aug 2019 08:53:12 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:11 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/27] drm/amdgpu: add renoir support for gpu_info and ip
 block setting
Date: Fri,  9 Aug 2019 10:52:38 -0500
Message-Id: <20190809155302.4733-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oVUgzXLi2r1xRSJkQhHpfQUojkGLwovxVapOwiHujj8=;
 b=qhwWYzCJHUpRMTmwwfJT5NWWbPzMvih4FjF7FpoBZM1378z+ECdpBRd40o1ua9XYkY
 7hnJAvJXwoHy+3avCZrwHVU1BdCKkzBoX01gI1cLIoq3RxlvU0ErEUUyoxWPTWNlb3CU
 koEL9iw3xU4SLHk6CEhmccs3UMu3L8rVbqGlF2+PCXBud5oFxvJdqsiyavaf0JDHlFXM
 Fxj72Hzb4ZhgqH18UpRXOGnwaXl9i9loPSpfZBk7VK3PJLtysbC1hHgCjVRh5aQe/PDc
 ghm8vK0Eha5mugEP/eyoUHIvZBr+BeGPx/e1u8mZpxWggWD9iqfmMUsTbM2Bhsc3rRii
 +Hxg==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggYWRkcyByZW5v
aXIgc3VwcG9ydCBmb3IgZ3B1X2luZm8gZmlybXdhcmUgYW5kIGlwIGJsb2NrIHNldHRpbmcuCgpT
aWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTog
SGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCBhMzdiNWJlNTY5YzAuLjdiMWFmZDE3MTI4MSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtNzAsNiArNzAs
NyBAQCBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9yYXZlbl9ncHVfaW5mby5iaW4iKTsKIE1PRFVM
RV9GSVJNV0FSRSgiYW1kZ3B1L3BpY2Fzc29fZ3B1X2luZm8uYmluIik7CiBNT0RVTEVfRklSTVdB
UkUoImFtZGdwdS9yYXZlbjJfZ3B1X2luZm8uYmluIik7CiBNT0RVTEVfRklSTVdBUkUoImFtZGdw
dS9hcmN0dXJ1c19ncHVfaW5mby5iaW4iKTsKK01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3Jlbm9p
cl9ncHVfaW5mby5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxMF9ncHVfaW5m
by5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxNF9ncHVfaW5mby5iaW4iKTsK
IE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxMl9ncHVfaW5mby5iaW4iKTsKQEAgLTE0NjAs
NiArMTQ2MSw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9wYXJzZV9ncHVfaW5mb19mdyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAljYXNlIENISVBfQVJDVFVSVVM6CiAJCWNoaXBf
bmFtZSA9ICJhcmN0dXJ1cyI7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9SRU5PSVI6CisJCWNoaXBf
bmFtZSA9ICJyZW5vaXIiOworCQlicmVhazsKIAljYXNlIENISVBfTkFWSTEwOgogCQljaGlwX25h
bWUgPSAibmF2aTEwIjsKIAkJYnJlYWs7CkBAIC0xNjEyLDcgKzE2MTYsOSBAQCBzdGF0aWMgaW50
IGFtZGdwdV9kZXZpY2VfaXBfZWFybHlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAljYXNlIENISVBfVkVHQTIwOgogCWNhc2UgQ0hJUF9SQVZFTjoKIAljYXNlIENISVBfQVJDVFVS
VVM6Ci0JCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZFTikKKwljYXNlIENISVBfUkVO
T0lSOgorCQlpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfUkFWRU4gfHwKKwkJICAgIGFkZXYt
PmFzaWNfdHlwZSA9PSBDSElQX1JFTk9JUikKIAkJCWFkZXYtPmZhbWlseSA9IEFNREdQVV9GQU1J
TFlfUlY7CiAJCWVsc2UKIAkJCWFkZXYtPmZhbWlseSA9IEFNREdQVV9GQU1JTFlfQUk7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
