Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26269872E
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB516E3A2;
	Wed, 21 Aug 2019 22:24:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84DF89F27
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:32 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s14so3365365qkm.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=of7MX83APfNgXUptACjyl5ZKa83be2X1V6t2ZgsoCVU=;
 b=QhPaA9ukeUw0c/4LxB6KAfPNXg/K6Qqy229myR6W2tCcU2mpjOYHzNfBCV6wtg3i/8
 LDG5+xc+im/XMl+mnqTLcr04b0uTzDCgEcMupLGUYKTOXdPDtJGjnPAmBQDonDtJuVoV
 TenRaY1E3ekKmT17LBjryBINY4JQm7fMuH3xQhjJ29z1L8V04+KgZX0yfrYmflTq/DCo
 0ktdNS+Tt/M6P8lNZxr9+jgTSZtzKoc+Hb8NMxMWPuZAwju0NV4rzC9bGB7plEPOKgJI
 fezj9BpXlXB5cHdH5aabHPa9/3PURgWUYX8/kLqw3EoyI/ejM81aSyDzsgAMbyo1JRFy
 cHvw==
X-Gm-Message-State: APjAAAXCLJEkXhIB4rwNtMTqG+FsVUlA7yMNRgBmEASLS9XyFWATmEWU
 X+uo6dBrPcSwbQUPxUlRFRXUpAB7
X-Google-Smtp-Source: APXvYqyaOs6QJryEsxZd0esYWbBL/eiYEI+Rwi/oGizFwjiI+IjILg1y4YkUUb70YAH+IEouHYCwCg==
X-Received: by 2002:ae9:e20c:: with SMTP id c12mr13915898qkc.187.1566426270987; 
 Wed, 21 Aug 2019 15:24:30 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 22/37] drm/amdgpu: enable BIF clock gating for rn
Date: Wed, 21 Aug 2019 17:23:44 -0500
Message-Id: <20190821222359.13578-23-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=of7MX83APfNgXUptACjyl5ZKa83be2X1V6t2ZgsoCVU=;
 b=dtFNX684omvfpQMQg9u/fc/NYr3VYjeTtWf8yC6PgHNcEjGI11cSfQm4nosl4QybPW
 rOK8zPNZRzQua0B4/KOfqp+sIHLWj52E8T3sOJhvieZYhdMWp+ss9BEvGTWvB08atcKv
 RjeYqsj+Eko6ciimvyavKvEjgxP3DD0/DFTtF5hypLi+n8bf7c2onSmB8mFXd7NoxLX2
 l4Fk90pMrz5/H9gBZvjm2EgZmRx/wD0ZC5GL5Zcun7kllr8VPl0zzxSrKcoEN6CcLJd3
 h9yrmR4C6x+JsKPux/39YrRW/53E+mVghk3F8mxOc36+LaUUmfXap+kqFKwWXDEJCZDe
 6ebQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpFbmFibGUgQklGIGxpZ2h0
IHNsZWVwIGNsb2NrIGdhdGluZy4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5M
aWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggNjc1MWM1ZjU3OTEzLi4yNWY1NWM3OTNmZWIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAtMTE2NCw3ICsxMTY0LDggQEAgc3RhdGlj
IGludCBzb2MxNV9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiAJCQkJIEFNRF9DR19T
VVBQT1JUX01DX01HQ0cgfAogCQkJCSBBTURfQ0dfU1VQUE9SVF9NQ19MUyB8CiAJCQkJIEFNRF9D
R19TVVBQT1JUX1NETUFfTUdDRyB8Ci0JCQkJIEFNRF9DR19TVVBQT1JUX1NETUFfTFM7CisJCQkJ
IEFNRF9DR19TVVBQT1JUX1NETUFfTFMgfAorCQkJCSBBTURfQ0dfU1VQUE9SVF9CSUZfTFM7CiAJ
CWFkZXYtPnBnX2ZsYWdzID0gMDsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0gYWRldi0+cmV2
X2lkICsgMHg5MTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
