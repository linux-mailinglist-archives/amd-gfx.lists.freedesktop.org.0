Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFE25D776
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF5D6E071;
	Tue,  2 Jul 2019 20:29:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9DE6E067
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:29 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id h21so20129931qtn.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xAtrkQ41fnQBFF9PIOHjH0fci9zD/M60f7djqNfKtJY=;
 b=C0z/SYIUBHiZ88adns2uin/k2E6E7Lha4zV/LXCyY+7rgAoM/dWKrxeYr9iKHnHxr1
 pIzyEtfNQbg5yXH9twCALysz1/w4NQDe23BHY0HrvmXyp5yluWnoK5g94pTZ0bSulpsK
 mPcsOu4WO+eFp10T+lB2EMu0FjeG2k4mfrRwnIRcyYijse6fiW6W5hvUdL/rjfHKrwkF
 1faz6V+N1enDdZWOIMcXM8ryq1u/bF+hDN9Yd4nsDkNBMB3pq/wT9LI1yaUT+rcwTMMI
 U4reQGN9epNPGxWbEC1lkioTJTbanViK9VTfciIDXBy/wXUdtJkcCAU2tKrGK12rYhd+
 EgUA==
X-Gm-Message-State: APjAAAXW0feHgKbxv0ckwoIAFizbbKkQ8ZWRRXq3m8zZmUnpIStJQY+q
 tiFKgZF4vKVtyLesBIMdb1hW9WcTOrM=
X-Google-Smtp-Source: APXvYqxvZH5KNWKyrEhLHr2d31166Ln9s4y7O+G0Pw26PEigjq/dKRXpiEcCt6enecBmMivfAxmBEQ==
X-Received: by 2002:a0c:d1f0:: with SMTP id k45mr28710454qvh.69.1562099368338; 
 Tue, 02 Jul 2019 13:29:28 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 37/53] drm/amd/display: add dm block
Date: Tue,  2 Jul 2019 15:28:28 -0500
Message-Id: <20190702202844.17001-38-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xAtrkQ41fnQBFF9PIOHjH0fci9zD/M60f7djqNfKtJY=;
 b=lDD04iTZT6/PgzbNgZe/dIyQMqQSaPfu4HF68TSvDeVsbuMbhcyOdLY1P2ZqU1tqim
 fMR9U81Uy+lGad/KGuqu4f6x/T43Ccbmt3eCkFmSpUOc4EG4mbjSpUSGaKHFPkf3acuq
 ly6uxyRpTNWaNDsspXy/Xp6jTWyRdivRG75OPaqQ0n03i0n7XO699iq9UjMujcbacmsy
 NjHj+T/uYTlaZUmLZQdwv6Ll7YI2pmqC8rDrcMBLrmG5hQUSLE7nZmF3R2800SgBIYpC
 r3LkD2jXITr4bJAGmnUmYPufldvF2ISIcz75lHGNQfFXntK+SCdLqHCtlVxbbfJMx1Ar
 jmUg==
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

RnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CgplbmFi
bGUgREMgZm9yIG5hdmkxNC4KClNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3
YW5wcmVldC5MYWtoYUBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jICAgICAgICAg
ICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCAwODJkYzUwMjVhNDEuLjA2OGQy
NzBkMDIyYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpA
QCAtMjQzMSw2ICsyNDMxLDcgQEAgYm9vbCBhbWRncHVfZGV2aWNlX2FzaWNfaGFzX2RjX3N1cHBv
cnQoZW51bSBhbWRfYXNpY190eXBlIGFzaWNfdHlwZSkKICNlbmRpZgogI2lmIGRlZmluZWQoQ09O
RklHX0RSTV9BTURfRENfRENOMl8wKQogCWNhc2UgQ0hJUF9OQVZJMTA6CisJY2FzZSBDSElQX05B
VkkxNDoKICNlbmRpZgogCQlyZXR1cm4gYW1kZ3B1X2RjICE9IDA7CiAjZW5kaWYKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9udi5jCmluZGV4IDIzOGM1YmIwNTYyMy4uYTgxNWFhZGQ0MGIyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L252LmMKQEAgLTM3MSw2ICszNzEsOCBAQCBpbnQgbnZfc2V0X2lwX2Jsb2Nrcyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRk
KGFkZXYsICZzbXVfdjExXzBfaXBfYmxvY2spOwogCQlpZiAoYWRldi0+ZW5hYmxlX3ZpcnR1YWxf
ZGlzcGxheSB8fCBhbWRncHVfc3Jpb3ZfdmYoYWRldikpCiAJCQlhbWRncHVfZGV2aWNlX2lwX2Js
b2NrX2FkZChhZGV2LCAmZGNlX3ZpcnR1YWxfaXBfYmxvY2spOworCQllbHNlIGlmIChhbWRncHVf
ZGV2aWNlX2hhc19kY19zdXBwb3J0KGFkZXYpKQorCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19h
ZGQoYWRldiwgJmRtX2lwX2Jsb2NrKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRl
diwgJmdmeF92MTBfMF9pcF9ibG9jayk7CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFk
ZXYsICZzZG1hX3Y1XzBfaXBfYmxvY2spOwogCQlicmVhazsKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
