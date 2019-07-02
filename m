Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 316B55D488
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 18:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B327E897F6;
	Tue,  2 Jul 2019 16:46:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13153897F6
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 16:46:08 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id m14so14694509qka.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 09:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zH/F5PvKLu3YzsGVbV6j5sb0ppBjRjMxHC/vrajoNdA=;
 b=HpFkEySmaOxtenf/+rgYsf1WCpWIvJm283iyxGmJVOsF1AOalc+7dKB5ZuOlJc7z7i
 NBqhYlcOiityc4oIryfAbSLQck2zh82Cx/Ic2NQiJP7PnAnmAwDJhLbYeahH522Ozzt0
 2o1JKdNs9aRzYTPaCiQ1Hd/JlrR/ftQlD8ld7rnFU5iCa/STqGeIlscCdbpJQJJ5omhR
 S7YACeIu70fmKpcFnJ76VX1ihD4fUvfRdg9piHA0EP963p1L5N5tU7YGA6rBaVzbnPcj
 al82D8R8HNl6L29F0a6/OW/TyyIbuiOTzMw/KO3FB2aqr6tEf9ndljahYy0k24kBgfON
 NuLQ==
X-Gm-Message-State: APjAAAVPNovWFDegKf1eJv6F3tlffeffu65Xq2M5go5dDl6DCWyY39nh
 98PuWlu23+euoMs1H04Ymg+2B+b1kzE=
X-Google-Smtp-Source: APXvYqzQ88TuK9mIg6iINdszxAtex9bGT4knJogwMKAJno4lA0o3H0adsy5hkoHpSCieGe1cXX510w==
X-Received: by 2002:a37:85c2:: with SMTP id
 h185mr21496702qkd.353.1562085966928; 
 Tue, 02 Jul 2019 09:46:06 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id u16sm7005093qte.32.2019.07.02.09.46.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 09:46:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/display: fix interrupt client id for navi
Date: Tue,  2 Jul 2019 11:45:58 -0500
Message-Id: <20190702164558.24846-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zH/F5PvKLu3YzsGVbV6j5sb0ppBjRjMxHC/vrajoNdA=;
 b=smzHUq3FR7tt4nDEDSmNuKtiFL4TxgtbdjzShirHFCZYv8EZGZ5YKn5ClLPs6kYYDG
 J6qw+DTAluqpWqeV2sjtbkZ7ojjgrrPZ9iy+09FvP/0M8xe93j2HF3aVHNGF83OONsPA
 +4RK5n/R5E5xU5nACoP7jvqQSsTf+M/NH1vwSOHIxuQeg3QO3k8xC682HXrvUrh6jSs0
 ZOqZ0jBRd2PCPEHM9/1k/UjVAHvknoJ5Pi1ubMZpOcChFP2lKkis80WEl2k9HpILWsuM
 NrfrTwkxw9SaORtlnMLwx1PWlAnrfUA/CQBGQIzaK9s7MN8qrxB4Jid3tkjiI0icijSt
 ebyA==
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

QWxsIGFzaWNzIG5ld2VyIHRoYW4gdmVnYTEwIHVzZSBjbGllbnQgaWRzLCBzbyBzaW1wbGlmeSB0
aGUKY2hlY2suCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYyB8IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYwppbmRleCBjZWY0NGNlODA5OWYuLmJlNWE1NjEwYzE2NSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC0xNTMz
LDEwICsxNTMzLDcgQEAgc3RhdGljIGludCBkY2UxMTBfcmVnaXN0ZXJfaXJxX2hhbmRsZXJzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWludCBpOwogCXVuc2lnbmVkIGNsaWVudF9pZCA9
IEFNREdQVV9JUlFfQ0xJRU5USURfTEVHQUNZOwogCi0JaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBD
SElQX1ZFR0ExMCB8fAotCSAgICBhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMTIgfHwKLQkg
ICAgYWRldi0+YXNpY190eXBlID09IENISVBfVkVHQTIwIHx8Ci0JICAgIGFkZXYtPmFzaWNfdHlw
ZSA9PSBDSElQX1JBVkVOKQorCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9WRUdBMTApCiAJ
CWNsaWVudF9pZCA9IFNPQzE1X0lIX0NMSUVOVElEX0RDRTsKIAogCWludF9wYXJhbXMucmVxdWVz
dGVkX3BvbGFyaXR5ID0gSU5URVJSVVBUX1BPTEFSSVRZX0RFRkFVTFQ7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
