Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AA448FE1
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A008489DB9;
	Mon, 17 Jun 2019 19:46:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221DE89DA4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:04 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id w17so5889778qto.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h0/YJ09ls+TOmyEoaTV3rVaQHXlBISeGuYduJ/97iN0=;
 b=UpReEputGrfHIFDIa7O1RCtJNcStyFniO198fprbak7LIRm6gIq8jTw0Q9UyDw4dJN
 FHzMo6YE4DRXQyvCVMY8NNPbrdf8x/miOxtaaRvEFl2CouC0Bn/2qCAeffijLw5v3zD/
 db50xfyx5ywL0a/39h5wnmPC1/UfrZww+o3Y11YqJzKeAuyfxdNQ0jCempDtab4/fncM
 u3SpN59gmLWoq0kaZEVP0MExLajwjzakts139I2HzUSmFiKuChlNfMz0h5r9Atup7BRr
 3E/XVzw8MPkhcfeJ97Y2reDtZAl7SE0ONx+knkYaRIfqj2T7UYMZi2Ze2eeKoHuleux6
 7Ohg==
X-Gm-Message-State: APjAAAW6a+/jgNhgXMcUuCn8OLIjNmY4XHrDkOPCVFv21D3sp41eLArS
 CHGHNSn9b5M+TIyfG2Upxo7DP1as2sE=
X-Google-Smtp-Source: APXvYqy67ydWUXQPObJ1YYzzfldMhUE5nNlqZgQnphysBgeZ5rVdtFt5F3ZXOg0iZDEn8muHrVUTDg==
X-Received: by 2002:ac8:24cd:: with SMTP id t13mr59019179qtt.298.1560800763093; 
 Mon, 17 Jun 2019 12:46:03 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:02 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 313/459] drm/amd/display: Read soc_bounding_box from gpu_info
 (v2)
Date: Mon, 17 Jun 2019 14:44:14 -0500
Message-Id: <20190617194540.18497-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h0/YJ09ls+TOmyEoaTV3rVaQHXlBISeGuYduJ/97iN0=;
 b=UiL7/uPGlvTE8qFLlUDIdbkfc9tNYQDs3ZVuyfQSkQ0HPvnV0h6lCHSs8mHxF3toeu
 gLLviTUR7nfBJmPMAcX7DqhZozOziZJplVmSFQ6JRoTLQ2OBnB93omKX3Ng7HixLK/r4
 fGxrxp48AoMO+js99vIl/LF8tJd8qcnJcdvZ87M7bUGl3GVSL40hoATUeSPpTmKODIX2
 51radgejkBeXVOoLYkGUwQWdeS7tF/Gb/mDcTV1MvIhtmYVLrlbqeQExQ02xQmzIX7qi
 q1MenWEjBKWnZTPd9lRXQaz/AigsrjeKOxoeY9MV9ZJ1h8HLB781HpFN/G2iFTgZg3Tu
 yIXw==
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
 Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CgpbV0hZXQpXZSBk
b24ndCB3YW50IHRvIGV4cG9zZSBzZW5zaXRpdmUgQVNJQyBpbmZvcm1hdGlvbiBiZWZvcmUgQVNJ
QyByZWxlYXNlLgoKW0hPV10KRW5jb2RlIHRoZSBzb2NfYm91bmRpbmdfYm94IGluIHRoZSBncHVf
aW5mbyBGVyAoZm9yIExpbnV4KSBhbmQgcmVhZCBpdAphdCBkcml2ZXIgbG9hZC4KCnYyOiBmaXgg
d2FybmluZyB3aGVuIENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMCBpcyBub3Qgc2V0IChBbGV4KQoK
U2lnbmVkLW9mZi1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgICAgfCAxMCArKy0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oICAgICB8IDYzICsrKysr
KysrKysrKysrKysrKysKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYyB8ICAzICsKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
aCB8ICA3ICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggICAgICAgICAg
IHwgIDkgKysrCiA1IGZpbGVzIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggY2Qy
OWM1NDc2YjFjLi42OTcwZDNmNTZjNTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMKQEAgLTE0MzEsNyArMTQzMSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2Rl
dmljZV9wYXJzZV9ncHVfaW5mb19mdyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJYWRl
di0+Z2Z4LmN1X2luZm8ubWF4X3NjcmF0Y2hfc2xvdHNfcGVyX2N1ID0KIAkJCWxlMzJfdG9fY3B1
KGdwdV9pbmZvX2Z3LT5nY19tYXhfc2NyYXRjaF9zbG90c19wZXJfY3UpOwogCQlhZGV2LT5nZngu
Y3VfaW5mby5sZHNfc2l6ZSA9IGxlMzJfdG9fY3B1KGdwdV9pbmZvX2Z3LT5nY19sZHNfc2l6ZSk7
Ci0JCWlmIChoZHItPnZlcnNpb25fbWlub3IgPT0gMSkgeworCQlpZiAoaGRyLT52ZXJzaW9uX21p
bm9yID49IDEpIHsKIAkJCWNvbnN0IHN0cnVjdCBncHVfaW5mb19maXJtd2FyZV92MV8xICpncHVf
aW5mb19mdyA9CiAJCQkJKGNvbnN0IHN0cnVjdCBncHVfaW5mb19maXJtd2FyZV92MV8xICopKGFk
ZXYtPmZpcm13YXJlLmdwdV9pbmZvX2Z3LT5kYXRhICsKIAkJCQkJCQkJCWxlMzJfdG9fY3B1KGhk
ci0+aGVhZGVyLnVjb2RlX2FycmF5X29mZnNldF9ieXRlcykpOwpAQCAtMTQ0MCw2ICsxNDQwLDE0
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9wYXJzZV9ncHVfaW5mb19mdyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKIAkJCWFkZXYtPmdmeC5jb25maWcubnVtX3BhY2tlcl9wZXJfc2Mg
PQogCQkJCWxlMzJfdG9fY3B1KGdwdV9pbmZvX2Z3LT5udW1fcGFja2VyX3Blcl9zYyk7CiAJCX0K
KyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzAKKwkJaWYgKGhkci0+dmVyc2lvbl9taW5v
ciA9PSAyKSB7CisJCQljb25zdCBzdHJ1Y3QgZ3B1X2luZm9fZmlybXdhcmVfdjFfMiAqZ3B1X2lu
Zm9fZncgPQorCQkJCShjb25zdCBzdHJ1Y3QgZ3B1X2luZm9fZmlybXdhcmVfdjFfMiAqKShhZGV2
LT5maXJtd2FyZS5ncHVfaW5mb19mdy0+ZGF0YSArCisJCQkJCQkJCQlsZTMyX3RvX2NwdShoZHIt
PmhlYWRlci51Y29kZV9hcnJheV9vZmZzZXRfYnl0ZXMpKTsKKwkJCWFkZXYtPmRtLnNvY19ib3Vu
ZGluZ19ib3ggPSAmZ3B1X2luZm9fZnctPnNvY19ib3VuZGluZ19ib3g7CisJCX0KKyNlbmRpZgog
CQlicmVhazsKIAl9CiAJZGVmYXVsdDoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV91Y29kZS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Vjb2RlLmgKaW5kZXggMDdmMDM1OTM3NjUwLi41MmIwMjQ5MTcwNzUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oCkBAIC0yMTAsNiArMjEwLDY5IEBAIHN0cnVj
dCBncHVfaW5mb19maXJtd2FyZV92MV8xIHsKIAl1aW50MzJfdCBudW1fcGFja2VyX3Blcl9zYzsK
IH07CiAKK3N0cnVjdCBncHVfaW5mb192b2x0YWdlX3NjYWxpbmdfdjFfMCB7CisJaW50IHN0YXRl
OworCXVpbnQzMl90IGRzY2Nsa19taHo7CisJdWludDMyX3QgZGNmY2xrX21oejsKKwl1aW50MzJf
dCBzb2NjbGtfbWh6OworCXVpbnQzMl90IGRyYW1fc3BlZWRfbXRzOworCXVpbnQzMl90IGZhYnJp
Y2Nsa19taHo7CisJdWludDMyX3QgZGlzcGNsa19taHo7CisJdWludDMyX3QgcGh5Y2xrX21oejsK
Kwl1aW50MzJfdCBkcHBjbGtfbWh6OworfTsKKworc3RydWN0IGdwdV9pbmZvX3NvY19ib3VuZGlu
Z19ib3hfdjFfMCB7CisJdWludDMyX3Qgc3JfZXhpdF90aW1lX3VzOworCXVpbnQzMl90IHNyX2Vu
dGVyX3BsdXNfZXhpdF90aW1lX3VzOworCXVpbnQzMl90IHVyZ2VudF9sYXRlbmN5X3VzOworCXVp
bnQzMl90IHVyZ2VudF9sYXRlbmN5X3BpeGVsX2RhdGFfb25seV91czsKKwl1aW50MzJfdCB1cmdl
bnRfbGF0ZW5jeV9waXhlbF9taXhlZF93aXRoX3ZtX2RhdGFfdXM7CisJdWludDMyX3QgdXJnZW50
X2xhdGVuY3lfdm1fZGF0YV9vbmx5X3VzOworCXVpbnQzMl90IHdyaXRlYmFja19sYXRlbmN5X3Vz
OworCXVpbnQzMl90IGlkZWFsX2RyYW1fYndfYWZ0ZXJfdXJnZW50X3BlcmNlbnQ7CisJdWludDMy
X3QgcGN0X2lkZWFsX2RyYW1fc2RwX2J3X2FmdGVyX3VyZ2VudF9waXhlbF9vbmx5OyAvLyBQZXJj
ZW50T2ZJZGVhbERSQU1GYWJyaWNBbmRTRFBQb3J0QldSZWNlaXZlZEFmdGVyVXJnTGF0ZW5jeVBp
eGVsRGF0YU9ubHkKKwl1aW50MzJfdCBwY3RfaWRlYWxfZHJhbV9zZHBfYndfYWZ0ZXJfdXJnZW50
X3BpeGVsX2FuZF92bTsKKwl1aW50MzJfdCBwY3RfaWRlYWxfZHJhbV9zZHBfYndfYWZ0ZXJfdXJn
ZW50X3ZtX29ubHk7CisJdWludDMyX3QgbWF4X2F2Z19zZHBfYndfdXNlX25vcm1hbF9wZXJjZW50
OworCXVpbnQzMl90IG1heF9hdmdfZHJhbV9id191c2Vfbm9ybWFsX3BlcmNlbnQ7CisJdW5zaWdu
ZWQgaW50IG1heF9yZXF1ZXN0X3NpemVfYnl0ZXM7CisJdWludDMyX3QgZG93bnNwcmVhZF9wZXJj
ZW50OworCXVpbnQzMl90IGRyYW1fcGFnZV9vcGVuX3RpbWVfbnM7CisJdWludDMyX3QgZHJhbV9y
d190dXJuYXJvdW5kX3RpbWVfbnM7CisJdWludDMyX3QgZHJhbV9yZXR1cm5fYnVmZmVyX3Blcl9j
aGFubmVsX2J5dGVzOworCXVpbnQzMl90IGRyYW1fY2hhbm5lbF93aWR0aF9ieXRlczsKKwl1aW50
MzJfdCBmYWJyaWNfZGF0YXBhdGhfdG9fZGNuX2RhdGFfcmV0dXJuX2J5dGVzOworCXVpbnQzMl90
IGRjbl9kb3duc3ByZWFkX3BlcmNlbnQ7CisJdWludDMyX3QgZGlzcGNsa19kcHBjbGtfdmNvX3Nw
ZWVkX21oejsKKwl1aW50MzJfdCBkZnNfdmNvX3BlcmlvZF9wczsKKwl1bnNpZ25lZCBpbnQgdXJn
ZW50X291dF9vZl9vcmRlcl9yZXR1cm5fcGVyX2NoYW5uZWxfcGl4ZWxfb25seV9ieXRlczsKKwl1
bnNpZ25lZCBpbnQgdXJnZW50X291dF9vZl9vcmRlcl9yZXR1cm5fcGVyX2NoYW5uZWxfcGl4ZWxf
YW5kX3ZtX2J5dGVzOworCXVuc2lnbmVkIGludCB1cmdlbnRfb3V0X29mX29yZGVyX3JldHVybl9w
ZXJfY2hhbm5lbF92bV9vbmx5X2J5dGVzOworCXVuc2lnbmVkIGludCByb3VuZF90cmlwX3Bpbmdf
bGF0ZW5jeV9kY2ZjbGtfY3ljbGVzOworCXVuc2lnbmVkIGludCB1cmdlbnRfb3V0X29mX29yZGVy
X3JldHVybl9wZXJfY2hhbm5lbF9ieXRlczsKKwl1bnNpZ25lZCBpbnQgY2hhbm5lbF9pbnRlcmxl
YXZlX2J5dGVzOworCXVuc2lnbmVkIGludCBudW1fYmFua3M7CisJdW5zaWduZWQgaW50IG51bV9j
aGFuczsKKwl1bnNpZ25lZCBpbnQgdm1tX3BhZ2Vfc2l6ZV9ieXRlczsKKwl1aW50MzJfdCBkcmFt
X2Nsb2NrX2NoYW5nZV9sYXRlbmN5X3VzOworCXVpbnQzMl90IHdyaXRlYmFja19kcmFtX2Nsb2Nr
X2NoYW5nZV9sYXRlbmN5X3VzOworCXVuc2lnbmVkIGludCByZXR1cm5fYnVzX3dpZHRoX2J5dGVz
OworCXVuc2lnbmVkIGludCB2b2x0YWdlX292ZXJyaWRlOworCXVpbnQzMl90IHhmY19idXNfdHJh
bnNwb3J0X3RpbWVfdXM7CisJdWludDMyX3QgeGZjX3hidWZfbGF0ZW5jeV90b2xlcmFuY2VfdXM7
CisJaW50IHVzZV91cmdlbnRfYnVyc3RfYnc7CisJdW5zaWduZWQgaW50IG51bV9zdGF0ZXM7CisJ
c3RydWN0IGdwdV9pbmZvX3ZvbHRhZ2Vfc2NhbGluZ192MV8wIGNsb2NrX2xpbWl0c1s4XTsKK307
CisKKy8qIGdwdSBpbmZvIHBheWxvYWQKKyAqIHZlcnNpb25fbWFqb3I9MSwgdmVyc2lvbl9taW5v
cj0xICovCitzdHJ1Y3QgZ3B1X2luZm9fZmlybXdhcmVfdjFfMiB7CisJc3RydWN0IGdwdV9pbmZv
X2Zpcm13YXJlX3YxXzEgdjFfMTsKKwlzdHJ1Y3QgZ3B1X2luZm9fc29jX2JvdW5kaW5nX2JveF92
MV8wIHNvY19ib3VuZGluZ19ib3g7Cit9OworCiAvKiB2ZXJzaW9uX21ham9yPTEsIHZlcnNpb25f
bWlub3I9MCAqLwogc3RydWN0IGdwdV9pbmZvX2Zpcm13YXJlX2hlYWRlcl92MV8wIHsKIAlzdHJ1
Y3QgY29tbW9uX2Zpcm13YXJlX2hlYWRlciBoZWFkZXI7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCA4YTgyNTQxZWQ1YzUuLjIz
MTNjMTUzYWFhZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jCkBAIC01NTcsNiArNTU3LDkgQEAgc3RhdGljIGludCBhbWRncHVfZG1f
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJaW5pdF9kYXRhLmZsYWdzLmZiY19z
dXBwb3J0ID0gdHJ1ZTsKIAogCWluaXRfZGF0YS5mbGFncy5wb3dlcl9kb3duX2Rpc3BsYXlfb25f
Ym9vdCA9IHRydWU7CisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRENOMl8wCisJaW5pdF9kYXRh
LnNvY19ib3VuZGluZ19ib3ggPSBhZGV2LT5kbS5zb2NfYm91bmRpbmdfYm94OworI2VuZGlmCiAK
IAkvKiBEaXNwbGF5IENvcmUgY3JlYXRlLiAqLwogCWFkZXYtPmRtLmRjID0gZGNfY3JlYXRlKCZp
bml0X2RhdGEpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmgKaW5kZXggMzM5NWYyZTRkNTY0Li4yYWI3MmJkZGI3YjEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaApAQCAtMjA2
LDYgKzIwNiwxMyBAQCBzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciB7CiAKIAljb25zdCBz
dHJ1Y3QgZmlybXdhcmUgKmZ3X2RtY3U7CiAJdWludDMyX3QgZG1jdV9md192ZXJzaW9uOworI2lm
ZGVmIENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMAorCS8qKgorCSAqIGdwdV9pbmZvIEZXIHByb3Zp
ZGVkIHNvYyBib3VuZGluZyBib3ggc3RydWN0IG9yIDAgaWYgbm90CisJICogYXZhaWxhYmxlIGlu
IEZXCisJICovCisJY29uc3Qgc3RydWN0IGdwdV9pbmZvX3NvY19ib3VuZGluZ19ib3hfdjFfMCAq
c29jX2JvdW5kaW5nX2JveDsKKyNlbmRpZgogfTsKIAogc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0
b3IgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAppbmRleCBjNGJkOTIxNmRkNjEuLmUy
OGI3ZmVlNDg0MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM3Myw2ICsz
NzMsNyBAQCBzdHJ1Y3QgZGNfYm91bmRpbmdfYm94X292ZXJyaWRlcyB7CiBzdHJ1Y3QgZGNfc3Rh
dGU7CiBzdHJ1Y3QgcmVzb3VyY2VfcG9vbDsKIHN0cnVjdCBkY2VfaHdzZXE7CitzdHJ1Y3QgZ3B1
X2luZm9fc29jX2JvdW5kaW5nX2JveF92MV8wOwogc3RydWN0IGRjIHsKIAlzdHJ1Y3QgZGNfdmVy
c2lvbnMgdmVyc2lvbnM7CiAJc3RydWN0IGRjX2NhcHMgY2FwczsKQEAgLTQ1MSw2ICs0NTIsMTQg
QEAgc3RydWN0IGRjX2luaXRfZGF0YSB7CiAKIAlzdHJ1Y3QgZGNfY29uZmlnIGZsYWdzOwogCXVp
bnQzMl90IGxvZ19tYXNrOworCisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRENOMl8wCisJLyoq
CisJICogZ3B1X2luZm8gRlcgcHJvdmlkZWQgc29jIGJvdW5kaW5nIGJveCBzdHJ1Y3Qgb3IgMCBp
ZiBub3QKKwkgKiBhdmFpbGFibGUgaW4gRlcKKwkgKi8KKwljb25zdCBzdHJ1Y3QgZ3B1X2luZm9f
c29jX2JvdW5kaW5nX2JveF92MV8wICpzb2NfYm91bmRpbmdfYm94OworI2VuZGlmCiB9OwogCiBz
dHJ1Y3QgZGNfY2FsbGJhY2tfaW5pdCB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
