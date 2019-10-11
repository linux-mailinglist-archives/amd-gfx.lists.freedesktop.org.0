Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F7AD36D2
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369336EB98;
	Fri, 11 Oct 2019 01:21:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693266EB98
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:21:50 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id u40so11538786qth.11
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M484Utf+qkIUFX6286SvSbvvXrFPrPVHiNi53kTxVQE=;
 b=KuvrQw3QIZ936OxzMPZgJtuPst7F6PAUR1co0VnmiDhLM/8DeD1akjunmFswHmwC2o
 SVmatC6W8OqpwFN3ZPh0U0F9tGYWiUEbMNyd3TAi4ow8XTa3GoLnLuToYRL2sfxusr8R
 OkpB1PZuV5cWM7/M4QYtb3zdxJxH6E58ypDXVvvLtohRmVQDTG4nro+R7u0QpSk5PWrQ
 E7YRDjeF42V7w5o6fplU5cB+QT99hDLGHoXgZe9J5wCjx/14WtspjLHxatx99BJwQvy0
 Gqh5QwJxjO2I76USg/274f9lA/tY4tjug8snAm5AApIdlS+e1TjLmmSF8wuA1ayJcD7g
 mExA==
X-Gm-Message-State: APjAAAUrK5f6Hj9kDZpNrAnnr722hgELY0YFx9rOqcZMkucb4+D1tFOW
 pw3pUxQ+XxARlpcHLfVOEPUBw15m
X-Google-Smtp-Source: APXvYqxvPhj99+OBPEaWq+KmBelPpfeuwgjBEXqqta6COq0tpN+AvYzrovaQPtZOX1AYFRH56u+I6w==
X-Received: by 2002:ac8:3934:: with SMTP id s49mr13373239qtb.321.1570756909238; 
 Thu, 10 Oct 2019 18:21:49 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id p199sm3301590qke.18.2019.10.10.18.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:21:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 05/15] drm/amdgpu: add new SMU 7.1.3 registers for BACO
Date: Thu, 10 Oct 2019 20:21:25 -0500
Message-Id: <20191011012135.18566-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011012135.18566-1-alexander.deucher@amd.com>
References: <20191011012135.18566-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M484Utf+qkIUFX6286SvSbvvXrFPrPVHiNi53kTxVQE=;
 b=Pp0dtlieU09CzTo1BBspFYHdXtlRSjHZL30WGmDaSBRMdj+sqFRMOnfQzeccMqPfPR
 /8XdBkHBBuFHU7HTCPHNzYKrjYT9W1tUdGZsnJ5awPbzmW/i+qzE7Gs/FfOqd6m4tegi
 5JJ28voW2FLpQ78P5EjVobyWcOoOiIM3f/TUPmN/mTDJIuWNLD9FrHDuSqkadIf6vTdT
 BbOBSMt6MSgQsg6l35aNQXl4b15bb7QhmFF9L/W0OPRggzpqfjpcB+if77hGZvVZeC/Q
 UvhyRFy/i6t2qS9crIrAa0Hgk/pnoB0OUS1u5wr2Ik0sQlFS3ZuiVqQ0jJdO+Llf85DX
 hMsw==
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

U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9zbXUvc211XzdfMV8zX2Qu
aCAgICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL3NtdS9z
bXVfN18xXzNfc2hfbWFzay5oIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvc211
L3NtdV83XzFfM19kLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvc211
L3NtdV83XzFfM19kLmgKaW5kZXggZjM1YWJhNzJlNjQwLi4yMWRhNjFjMzk4ZjUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9zbXUvc211XzdfMV8zX2Qu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvc211L3NtdV83XzFf
M19kLmgKQEAgLTUyLDYgKzUyLDcgQEAKICNkZWZpbmUgaXhDR19TUExMX0ZVTkNfQ05UTF81ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhjMDUwMDE1
MAogI2RlZmluZSBpeENHX1NQTExfRlVOQ19DTlRMXzYgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAweGMwNTAwMTU0CiAjZGVmaW5lIGl4Q0dfU1BMTF9G
VU5DX0NOVExfNyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDB4YzA1MDAxNTgKKyNkZWZpbmUgaXhDR19TUExMX1NUQVRVUyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhDMDUwMDE1QwogI2RlZmlu
ZSBpeFNQTExfQ05UTF9NT0RFICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweGMwNTAwMTYwCiAjZGVmaW5lIGl4Q0dfU1BMTF9TUFJFQURfU1BF
Q1RSVU0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4YzA1
MDAxNjQKICNkZWZpbmUgaXhDR19TUExMX1NQUkVBRF9TUEVDVFJVTV8yICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhjMDUwMDE2OApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL3NtdS9zbXVfN18xXzNfc2hfbWFzay5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL3NtdS9zbXVfN18xXzNfc2hf
bWFzay5oCmluZGV4IDQ4MWVlNjU2MGFhOS4uZjY0ZmUwZmJjYjMyIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvc211L3NtdV83XzFfM19zaF9tYXNrLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL3NtdS9zbXVfN18xXzNf
c2hfbWFzay5oCkBAIC0yMjAsNiArMjIwLDggQEAKICNkZWZpbmUgQ0dfU1BMTF9GVU5DX0NOVExf
Nl9fU1BMTF9MRl9DTlRSX19TSElGVCAweDE5CiAjZGVmaW5lIENHX1NQTExfRlVOQ19DTlRMXzdf
X1NQTExfQldfQ05UUkxfTUFTSyAweGZmZgogI2RlZmluZSBDR19TUExMX0ZVTkNfQ05UTF83X19T
UExMX0JXX0NOVFJMX19TSElGVCAweDAKKyNkZWZpbmUgQ0dfU1BMTF9TVEFUVVNfX1NQTExfQ0hH
X1NUQVRVU19NQVNLIDB4MgorI2RlZmluZSBDR19TUExMX1NUQVRVU19fU1BMTF9DSEdfU1RBVFVT
X19TSElGVCAweDEKICNkZWZpbmUgU1BMTF9DTlRMX01PREVfX1NQTExfU1dfRElSX0NPTlRST0xf
TUFTSyAweDEKICNkZWZpbmUgU1BMTF9DTlRMX01PREVfX1NQTExfU1dfRElSX0NPTlRST0xfX1NI
SUZUIDB4MAogI2RlZmluZSBTUExMX0NOVExfTU9ERV9fU1BMTF9MRUdBQ1lfUERJVl9NQVNLIDB4
MgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
