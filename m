Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F16A7E434
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E946E7EC;
	Thu,  1 Aug 2019 20:30:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A779D6E7EC
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:30 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d17so71557951qtj.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bShmr6sSE4gckZbZ1tOAkS71EFw39p4FGIB+hApqG2o=;
 b=boInqLbkZYuoLXkyE8TMUhs0dqX+xdItS2Va2Gk2UenRceQYKg6JwaWICOCrv6sDWc
 hA4r0eVj8xePViAtrgbvPIr2LG0F+uk6f+O6b6cqUOXXexK894jSRJQT4IFBhjnrCxBk
 V382myhCh6RRPrhi8L44H3AN24OnDKYOd+WCwi1780ydXKl0CvrheC0QRQpBji3rz2EV
 Ab0SJs7mnO+Taot5pr1F2gRR4xNThUzQTOLdPV2LueMIB5AczgOiWInCxqyBKpwMw9zu
 6QU9RWzSkH1KROwiLM/rWd2TgJrdV787UnJn1/LalRpL9Au5r1W6JrOdwMh7LpWzR4lr
 CNIA==
X-Gm-Message-State: APjAAAXhmnGq6A2rlKlO5TD8GQTB9S/P4OE/tw9HdMYsn9GfXSlWyGQl
 EiLPBJpOSzw9Vt41vGaKkLuM1sXp
X-Google-Smtp-Source: APXvYqwtHprL3YE46LVuSPJXok8H5q8/Pl/mwHW8sT9I7GHECpPPsW++A6Ym4LnHSerhjGYs/yqVBA==
X-Received: by 2002:ac8:41d1:: with SMTP id o17mr65014004qtm.17.1564691429495; 
 Thu, 01 Aug 2019 13:30:29 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 27/36] drm/amdgpu: start autoload till RLCG fw for navi12
Date: Thu,  1 Aug 2019 15:29:48 -0500
Message-Id: <20190801202957.29791-28-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bShmr6sSE4gckZbZ1tOAkS71EFw39p4FGIB+hApqG2o=;
 b=uBGb/0yeqtsS4q5lso7s3tNp6o0NDug+NOUdEsUrZCph3Olqt4MNPUgkeJP4zyAHbc
 fQ8XKdB3v072CXgdZpelstfnDIYwGJJa1LQTE0Y15wM2bUoA82u+POUaqrdWgoXtluoA
 DsbEdATwDatGe6MfPXh4Xvz5I8FSp01gwn64i7/wnHlVnSI8HUsquV/aKHmkpFxITCPP
 xFpJdUfZ8ichq38hHuSLjW+0rGds3Q1OIByIgMO5oipgKWADD/TvvLC9YoxbyjSMzN8v
 u3zzEo5QxfdSvzCpneQmKtu7h3d4wsGZsFDWqMomhtP8YXRJEyMFz4vvipHyVzLDBib8
 gtuw==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCnJsYyBzYXZlIHJlc3Rv
cmUgbGlzdCBpcyBub3QgcmVhZHkgeWV0IGZvciBuYXZpMTIKClNpZ25lZC1vZmYtYnk6IFhpYW9q
aWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWNrIFhpYW8gPEph
Y2suWGlhb0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bz
cC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKaW5kZXggY2JlMGE0ZWU4
YzgzLi4yNzgyNTcwZWE5ZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wc3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNw
LmMKQEAgLTk5OSw3ICs5OTksOCBAQCBzdGF0aWMgaW50IHBzcF9ucF9md19sb2FkKHN0cnVjdCBw
c3BfY29udGV4dCAqcHNwKQogCQkJcmV0dXJuIHJldDsKIAogCQkvKiBTdGFydCBybGMgYXV0b2xv
YWQgYWZ0ZXIgcHNwIHJlY2lldmVkIGFsbCB0aGUgZ2Z4IGZpcm13YXJlICovCi0JCWlmICh1Y29k
ZS0+dWNvZGVfaWQgPT0gQU1ER1BVX1VDT0RFX0lEX1JMQ19SRVNUT1JFX0xJU1RfU1JNX01FTSkg
eworCQlpZiAodWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09ERV9JRF9STENfUkVTVE9SRV9M
SVNUX1NSTV9NRU0gfHwKKwkJICAgIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9OQVZJMTIgJiYg
dWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09ERV9JRF9STENfRykpIHsKIAkJCXJldCA9IHBz
cF9ybGNfYXV0b2xvYWQocHNwKTsKIAkJCWlmIChyZXQpIHsKIAkJCQlEUk1fRVJST1IoIkZhaWxl
ZCB0byBzdGFydCBybGMgYXV0b2xvYWRcbiIpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
