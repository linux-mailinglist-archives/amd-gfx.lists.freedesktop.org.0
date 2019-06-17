Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8379D49063
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C026E060;
	Mon, 17 Jun 2019 19:50:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926216E05C
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:28 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x47so12270657qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=byu+eFN7UDSZttDBK3Bkd1E4FYI6/nObyvn9dn2QQz8=;
 b=CM9V1+Ornb+rHoSwRRH2wBJb1TkxLPQtoRDPadwh1SjnMAIYhK8OGBAw/89OgiGHYw
 bPQyes1b73xtOM+C51+u1HBc5Db0tfzLNac51ACn97e6cf+Wh2zlNpOSWq+nKRnRN6x/
 z6qX8hVJn9WMXZSnFKo8EgIHTdplE5cOsm4sz2f6CiEKgANA+nBziu23XFNmYC0jDiYN
 gXbrh7SaSQXeJHBzlQ4ibX4zxpFq81gcH27Ce63JM0VIZhI7j6owsRp1x1lZ1qpRQGW7
 dt6wDPU5T33Q9IHWMLbLAh5Bm7ApCMHPxAZr9HZVKkZ9gniZMkt78Dg4iI+WEkNCSU1a
 cSDQ==
X-Gm-Message-State: APjAAAUMS11XVD/bZ09w+0xhS7IrYA1XepLFA6K+QTRh/fe2qAuVKRYL
 TmcYGGyzaVoNOVE94s82ElqfhCDHAKG1Aw==
X-Google-Smtp-Source: APXvYqyQH6e5uK+9gxiNYPolL6HZLmbXiMqTbQjn2U08inZOG80pYicN0gAh6bDT/m+x+xfmngJPUw==
X-Received: by 2002:a0c:9214:: with SMTP id a20mr23760668qva.195.1560801027616; 
 Mon, 17 Jun 2019 12:50:27 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 431/459] drm/amd/display: always use 4 dp lanes for dml
Date: Mon, 17 Jun 2019 14:49:20 -0500
Message-Id: <20190617194948.18667-32-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=byu+eFN7UDSZttDBK3Bkd1E4FYI6/nObyvn9dn2QQz8=;
 b=sPWxaXGCMQR19F66p2jqtBaPj60+jfMVqAPOG2B7kJvryBo6NuFso1DS1w+ogYoNN2
 Zqz3GC9pkE/YyMuvATC/Xrl0NBux0wXDPXGnNbbcuBJeaoFDcLHNm3tpqxxTPo+tYGmm
 IPE+nGAdwbizQklTvzVZWr3SJ4zJJ5CeSuN/NupxoWVhhbqsnocvVzj1f2vJB+mXYVFJ
 ENjqIU0HuRN20vSueBKJJnZQKIuwZSlWY+iEoYcd9ihqNnRGvzj4VkcpHF/rzC2aIlO2
 Yb1eU2rGw6hyUC4e0UW8+q6kfIoVbvXtFH7TR+I9MWGuRb1gZ9aPXrz/J3ZyIRSS44Hq
 tEig==
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Eric Yang <eric.yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KY3VycmVudCBETUwgbG9naWMg
dXNlcyBjdXJyZW50bHkgdHJhaW5lZCBzZXR0aW5nIGZvciBudW1iZXIKb2YgZHAgbGFuZXMgaW4g
RE1MIGNhbGN1bGF0aW9ucy4gIHRoaXMgaXMgb2J2aW91c2x5IGZsYXdlZCBzaW5jZQpqdXN0IGJl
Y2F1c2UgMSBsYW5lIGlzIGluIHVzZSBkb2Vzbid0IG1lYW4gb25seSAxIGxhbmUgY2FuIGJlIHVz
ZWQKCnRoaXMgY2F1c2VzIG1vZGUgdmFsaWRhdGlvbiB0byBmYWlsIGRlcGVuZGluZyBvbiBjdXJy
ZW50IHN0YXRlLAp3aGljaCBpcyBpbmNvcnJlY3QKCltob3ddCkRNTCBzaG91bGQgYWx3YXlzIGFz
c3VtZSA0IGxhbmVzIGFyZSBhdmFpbGFibGUuICB2YWxpZGF0aW9uIG9mCmJhbmR3aWR0aCBpcyBu
b3Qgc3VwcG9zZWQgdG8gYmUgaGFuZGxlZCBieSBETUwsIHNpbmNlIHdlIGRvCmxpbmsgdmFsaWRh
dGlvbiB3aXRob3V0IERNTCBhbHJlYWR5CgphbHNvLCBETUwgaXMgZXhwZWN0aW5nIHRoZXJlIHRv
IGJlIGEgY29weSBvZiB0aGUgbWF4IHN0YXRlLCB0aGlzCnN0YXRlIGlzIHJlbW92ZWQgd2hlbiB1
cGRhdGVfYm91bmRpbmdfYm94IGlzIGNhbGxlZCB0byB1cGRhdGUKYWN0dWFsIFNLVSBjbG9ja3Mu
ICBmaXggdGhpcyBhcyB3ZWxsIGJ5IGR1cGluZyBsYXN0IHN0YXRlLgoKU2lnbmVkLW9mZi1ieTog
SnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRG15dHJvIExha3R5dXNoa2lu
IDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hh
IDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpBY2tlZC1ieTogRXJpYyBZYW5nIDxlcmljLnlh
bmcyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9y
ZXNvdXJjZS5jICAgIHwgMTIgKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKaW5kZXggY2FlYmY0NzQ2NDc1Li4yNjZk
MmVhNTA4ODIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9yZXNvdXJjZS5jCkBAIC0xNjE5LDcgKzE2MTksNiBAQCBpbnQgZGNuMjBfcG9w
dWxhdGVfZG1sX3BpcGVzX2Zyb21fY29udGV4dCgKIAogCWZvciAoaSA9IDAsIHBpcGVfY250ID0g
MDsgaSA8IGRjLT5yZXNfcG9vbC0+cGlwZV9jb3VudDsgaSsrKSB7CiAJCXN0cnVjdCBkY19jcnRj
X3RpbWluZyAqdGltaW5nID0gJnJlc19jdHgtPnBpcGVfY3R4W2ldLnN0cmVhbS0+dGltaW5nOwot
CQlzdHJ1Y3QgZGNfbGluayAqbGluazsKIAogCQlpZiAoIXJlc19jdHgtPnBpcGVfY3R4W2ldLnN0
cmVhbSkKIAkJCWNvbnRpbnVlOwpAQCAtMTY2NSwxNiArMTY2NCw3IEBAIGludCBkY24yMF9wb3B1
bGF0ZV9kbWxfcGlwZXNfZnJvbV9jb250ZXh0KAogCQlpZiAodGltaW5nLT50aW1pbmdfM2RfZm9y
bWF0ID09IFRJTUlOR18zRF9GT1JNQVRfSFdfRlJBTUVfUEFDS0lORykKIAkJCXBpcGVzW3BpcGVf
Y250XS5waXBlLmRlc3QucGl4ZWxfcmF0ZV9taHogKj0gMjsKIAkJcGlwZXNbcGlwZV9jbnRdLnBp
cGUuZGVzdC5vdGdfaW5zdCA9IHJlc19jdHgtPnBpcGVfY3R4W2ldLnN0cmVhbV9yZXMudGctPmlu
c3Q7Ci0KLQkJbGluayA9IHJlc19jdHgtPnBpcGVfY3R4W2ldLnN0cmVhbS0+bGluazsKLQkJaWYg
KGxpbmstPmN1cl9saW5rX3NldHRpbmdzLmxhbmVfY291bnQgIT0gTEFORV9DT1VOVF9VTktOT1dO
KSB7Ci0JCQlwaXBlc1twaXBlX2NudF0uZG91dC5kcF9sYW5lcyA9IGxpbmstPmN1cl9saW5rX3Nl
dHRpbmdzLmxhbmVfY291bnQ7Ci0JCX0gZWxzZSBpZiAobGluay0+dmVyaWZpZWRfbGlua19jYXAu
bGFuZV9jb3VudCAhPSBMQU5FX0NPVU5UX1VOS05PV04pIHsKLQkJCXBpcGVzW3BpcGVfY250XS5k
b3V0LmRwX2xhbmVzID0gbGluay0+dmVyaWZpZWRfbGlua19jYXAubGFuZV9jb3VudDsKLQkJfSBl
bHNlIHsKLQkJCS8qIFVua25vd24gbGluayBjYXBhYmlsaXRpZXMsIHNvIGFzc3VtZSBtYXggKi8K
LQkJCXBpcGVzW3BpcGVfY250XS5kb3V0LmRwX2xhbmVzID0gNDsKLQkJfQorCQlwaXBlc1twaXBl
X2NudF0uZG91dC5kcF9sYW5lcyA9IDQ7CiAJCXBpcGVzW3BpcGVfY250XS5waXBlLmRlc3QudnRv
dGFsX21pbiA9IHJlc19jdHgtPnBpcGVfY3R4W2ldLnN0cmVhbS0+YWRqdXN0LnZfdG90YWxfbWlu
OwogCQlwaXBlc1twaXBlX2NudF0ucGlwZS5kZXN0LnZ0b3RhbF9tYXggPSByZXNfY3R4LT5waXBl
X2N0eFtpXS5zdHJlYW0tPmFkanVzdC52X3RvdGFsX21heDsKIAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
