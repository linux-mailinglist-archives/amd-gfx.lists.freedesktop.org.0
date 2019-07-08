Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A19C628AC
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 20:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF4E6E03A;
	Mon,  8 Jul 2019 18:48:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E756E036
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 18:48:26 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r21so13850712qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Jul 2019 11:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dzPDq4U/kzMyMb/a/96VAoXGd+cI7Hj8br7rGCOpN/E=;
 b=VLLOLdop2QZ+4zt9pbUmC792BAMai7hrvj/QbVW7Tr4hoN3dfj7zRqjxxXBcZoI7at
 cqonet0Z6TMz50mhG/O6g58ljEgNFC00HHVgxx+nTRzN8HoE2q42aXqeRtXIKsORRHJx
 Idu001TO6NWzVN+cLYkPNL5S3ma4KFW8AxnCr1alvGGAiG+tjKPSH+u4twHoJx/ln39f
 ZInLeCcJuPCJ+iI1GjwMdu4DmWK64BAenwO/7biAe//ZA1gNDNogtDLOVCC84WJ9aeFd
 s5bA3q/Fpb8ilgCYOz7BTOec5P6f+RW6tOoy5F/MC2aCNLIOeKr/j+rrX/0tFXgCEeNV
 mavg==
X-Gm-Message-State: APjAAAWQHdoNMaCYufdD4Wyi0vm+wTl9jC8mWu3/Lrium5gjUuoHLpB9
 FUyjtznlv1pTj31h3txZf42/8CJF
X-Google-Smtp-Source: APXvYqyUJYGmKT154TcDS+7tABs5mIihZP0V2RDsSsFKzd+DlD8b14H+BzxX9KVdSY3ROTX8EW3Dnw==
X-Received: by 2002:a37:a343:: with SMTP id m64mr15590936qke.75.1562611705706; 
 Mon, 08 Jul 2019 11:48:25 -0700 (PDT)
Received: from localhost.localdomain ([71.219.77.97])
 by smtp.gmail.com with ESMTPSA id h26sm8954179qta.58.2019.07.08.11.48.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 11:48:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu: add missing documentation on new module
 parameters
Date: Mon,  8 Jul 2019 13:48:09 -0500
Message-Id: <20190708184811.6409-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dzPDq4U/kzMyMb/a/96VAoXGd+cI7Hj8br7rGCOpN/E=;
 b=NESuxlxPusD9AtEEX4X6fZ46UM1Mo7dDv8kJkXKsF+OKw7Q92JHSgzunbTPl/Za6/P
 DhxUN5kXKdcbFSAkusxWCXYsib76EEAfxGjZXgk9SqjITxmeCHR4CG4/QLJStc1GgSgT
 Q3+KN+sx92Kt3ojqbL3X4BM+ZS0HR6SjYucIXTaTEFxQYZvm0xtcfPiaDAc8en0CyG8l
 /c8CT/iol4vdhF8ODKV5AL7PEdiuoDTflhyT639y4auWrkjoKG5LW6j+LpQyrxvVE2TF
 nw+pITI9/FAQ8v28b3TdYoPZ1g3uZ780PpfyVHyp9naOK3oyyDOSUqE5BWGSDANnlekF
 4o5Q==
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

TmV3IHBhcmFtZXRlcnMgYWRkZWQgZm9yIG5hdmkgbGFjayBkb2N1bWVudGF0aW9uLgoKU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDEzICsrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jCmluZGV4IDM5MTNhNzU5MjRjNi4uNzk0MWE1MzY4ZmI1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCkBAIC01ODEsMTQgKzU4MSwyNyBAQCBN
T0RVTEVfUEFSTV9ERVNDKGFzeW5jX2dmeF9yaW5nLAogCSJBc3luY2hyb25vdXMgR0ZYIHJpbmdz
IHRoYXQgY291bGQgYmUgY29uZmlndXJlZCB3aXRoIGVpdGhlciBkaWZmZXJlbnQgcHJpb3JpdGll
cyAoSFAzRCByaW5nIGFuZCBMUDNEIHJpbmcpLCBvciBlcXVhbCBwcmlvcml0aWVzICgwID0gZGlz
YWJsZWQsIDEgPSBlbmFibGVkIChkZWZhdWx0KSkiKTsKIG1vZHVsZV9wYXJhbV9uYW1lZChhc3lu
Y19nZnhfcmluZywgYW1kZ3B1X2FzeW5jX2dmeF9yaW5nLCBpbnQsIDA0NDQpOwogCisvKioKKyAq
IERPQzogbWNicCAoaW50KQorICogSXQgaXMgdXNlZCB0byBlbmFibGUgbWlkIGNvbW1hbmQgYnVm
ZmVyIHByZWVtcHRpb24uICgwID0gZGlzYWJsZWQgKGRlZmF1bHQpLCAxID0gZW5hYmxlZCkKKyAq
LwogTU9EVUxFX1BBUk1fREVTQyhtY2JwLAogCSJFbmFibGUgTWlkLWNvbW1hbmQgYnVmZmVyIHBy
ZWVtcHRpb24gKDAgPSBkaXNhYmxlZCAoZGVmYXVsdCksIDEgPSBlbmFibGVkKSIpOwogbW9kdWxl
X3BhcmFtX25hbWVkKG1jYnAsIGFtZGdwdV9tY2JwLCBpbnQsIDA0NDQpOwogCisvKioKKyAqIERP
QzogZGlzY292ZXJ5IChpbnQpCisgKiBBbGxvdyBkcml2ZXIgdG8gZGlzY292ZXIgaGFyZHdhcmUg
SVAgaW5mb3JtYXRpb24gZnJvbSBJUCBEaXNjb3ZlcnkgdGFibGUgYXQgdGhlIHRvcCBvZiBWUkFN
LgorICovCiBNT0RVTEVfUEFSTV9ERVNDKGRpc2NvdmVyeSwKIAkiQWxsb3cgZHJpdmVyIHRvIGRp
c2NvdmVyIGhhcmR3YXJlIElQcyBmcm9tIElQIERpc2NvdmVyeSB0YWJsZSBhdCB0aGUgdG9wIG9m
IFZSQU0iKTsKIG1vZHVsZV9wYXJhbV9uYW1lZChkaXNjb3ZlcnksIGFtZGdwdV9kaXNjb3Zlcnks
IGludCwgMDQ0NCk7CiAKKy8qKgorICogRE9DOiBtZXMgKGludCkKKyAqIEVuYWJsZSBNaWNybyBF
bmdpbmUgU2NoZWR1bGVyLiBUaGlzIGlzIGEgbmV3IGh3IHNjaGVkdWxpbmcgZW5naW5lIGZvciBn
ZngsIHNkbWEsIGFuZCBjb21wdXRlLgorICogKDAgPSBkaXNhYmxlZCAoZGVmYXVsdCksIDEgPSBl
bmFibGVkKQorICovCiBNT0RVTEVfUEFSTV9ERVNDKG1lcywKIAkiRW5hYmxlIE1pY3JvIEVuZ2lu
ZSBTY2hlZHVsZXIgKDAgPSBkaXNhYmxlZCAoZGVmYXVsdCksIDEgPSBlbmFibGVkKSIpOwogbW9k
dWxlX3BhcmFtX25hbWVkKG1lcywgYW1kZ3B1X21lcywgaW50LCAwNDQ0KTsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
