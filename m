Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C98D587E93
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BE86EE3C;
	Fri,  9 Aug 2019 15:53:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451496EE3C
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:17 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d79so71916933qke.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=evn8eoM6zPisoiEA4dioJDH9f5bNnDVs29EsgWcS92o=;
 b=mKv/o58lgQrEzz7TQ6C2B+4uu6MYXonB2TlRvOXpiOqJs4Wdc3nJJYHTxbQRxvFjBv
 /6rA1EPrtv8VgYTP0eVn+gO+I/JkFBbikW0EytH6G53xUyegHVAk/TJNKgnzackl9ua0
 nyjBXa2O+hf/TSEY+SY6FI22uSUJMMhTdIs+QeClfMlgr9mI1o/BO3Ks9guzOIB5er1i
 NralFjG1ByLTsZljAM+Ls4qaqa3jr5OPFXwhDWiXVWoJNsJ//V8RE0yfJnKFRxii2doV
 n6kI224JlidYCyaj1lH2DXBGDKOyKoNnZoOqszS8P09WgGGuEJ/fBW2X1+lcJyTEr+ot
 E0LA==
X-Gm-Message-State: APjAAAUaaDve2+PSzEC1kXr1hqKzrrVyjSX+5bCF2xQ1GyqU2a6TyQ5t
 Q3PuGO8C5mUYYUHNgIlYTN0tKb1X
X-Google-Smtp-Source: APXvYqzeabshn1sSLE1R8wzbijMmbBE5KgchvRURHehzmvfFEGbAQ9UCFo50ZdYuaO8e9kPunrNrlA==
X-Received: by 2002:a37:454:: with SMTP id 81mr18442492qke.153.1565365996031; 
 Fri, 09 Aug 2019 08:53:16 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/27] drm/amdgpu: add gfx support for renoir
Date: Fri,  9 Aug 2019 10:52:42 -0500
Message-Id: <20190809155302.4733-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=evn8eoM6zPisoiEA4dioJDH9f5bNnDVs29EsgWcS92o=;
 b=iIOMK3IOBbgcRnY2+UjWjhV8FnxYdFD4hmE4l6dPdpnoCjf24jNRv7tdEhdve9XtZU
 3sECtxA4GlED6G1Cx4bDa8lLweZ8DW73hurVXq9TneBz4sW/Ll1VX3E/5ubHR/zjN2EG
 RObgOxoqb9AEO45o/sWQ+bODW3nOP4u/PJvBr2Qpuc0mL/SLLpbZmBEM/16blGERGm4B
 JBXf5DHeN/1VMgSPLt7RFt8i3qrDBy1p5ll0A9+jpRTh00tRF5VYjUziBFanxiPTsyR8
 F3w/ifYnD/88SyUfISZQbzHG+XIlmyF2qpVmkkl1pGd6AfKlLdptOysAGrmYWLZJgwPi
 6xLQ==
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

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KCkFkZCBSZW5vaXIgY2hlY2tzIHRv
IGdmeDkgY29kZS4KClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwgMjYgKysrKysrKysrKysrKysr
KysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IDY4ZjgyMzgyMGEw
OC4uMjNjN2I2Mzk0NTA2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAg
LTEwNCw2ICsxMDQsMTMgQEAgTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvYXJjdHVydXNfbWVjLmJp
biIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvYXJjdHVydXNfbWVjMi5iaW4iKTsKIE1PRFVM
RV9GSVJNV0FSRSgiYW1kZ3B1L2FyY3R1cnVzX3JsYy5iaW4iKTsKIAorTU9EVUxFX0ZJUk1XQVJF
KCJhbWRncHUvcmVub2lyX2NlLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvcmVub2ly
X3BmcC5iaW4iKTsKK01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3Jlbm9pcl9tZS5iaW4iKTsKK01P
RFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3Jlbm9pcl9tZWMuYmluIik7CitNT0RVTEVfRklSTVdBUkUo
ImFtZGdwdS9yZW5vaXJfbWVjMi5iaW4iKTsKK01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3Jlbm9p
cl9ybGMuYmluIik7CisKICNkZWZpbmUgbW1UQ1BfQ0hBTl9TVEVFUl8wX0FSQ1QJCQkJCQkJCTB4
MGIwMwogI2RlZmluZSBtbVRDUF9DSEFOX1NURUVSXzBfQVJDVF9CQVNFX0lEWAkJCQkJCQkwCiAj
ZGVmaW5lIG1tVENQX0NIQU5fU1RFRVJfMV9BUkNUCQkJCQkJCQkweDBiMDQKQEAgLTEzMzksNiAr
MTM0Niw5IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiAJY2FzZSBDSElQX0FSQ1RVUlVTOgogCQljaGlwX25hbWUgPSAiYXJj
dHVydXMiOwogCQlicmVhazsKKwljYXNlIENISVBfUkVOT0lSOgorCQljaGlwX25hbWUgPSAicmVu
b2lyIjsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJQlVHKCk7CiAJfQpAQCAtMTU5OCw3ICsxNjA4
LDcgQEAgc3RhdGljIGludCBnZnhfdjlfMF9ybGNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIAkJCXJldHVybiByOwogCX0KIAotCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9S
QVZFTikgeworCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZFTiB8fCBhZGV2LT5hc2lj
X3R5cGUgPT0gQ0hJUF9SRU5PSVIpIHsKIAkJLyogVE9ETzogZG91YmxlIGNoZWNrIHRoZSBjcF90
YWJsZV9zaXplIGZvciBSViAqLwogCQlhZGV2LT5nZngucmxjLmNwX3RhYmxlX3NpemUgPSBBTElH
Tig5NiAqIDUgKiA0LCAyMDQ4KSArICg2NCAqIDEwMjQpOyAvKiBKVCArIEdEUyAqLwogCQlyID0g
YW1kZ3B1X2dmeF9ybGNfaW5pdF9jcHQoYWRldik7CkBAIC0xODU5LDYgKzE4NjksMTYgQEAgc3Rh
dGljIGludCBnZnhfdjlfMF9ncHVfZWFybHlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIAkJZ2JfYWRkcl9jb25maWcgJj0gfjB4ZjNlNzc3ZmY7CiAJCWdiX2FkZHJfY29uZmlnIHw9
IDB4MjIwMTQwNDI7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9SRU5PSVI6CisJCWFkZXYtPmdmeC5j
b25maWcubWF4X2h3X2NvbnRleHRzID0gODsKKwkJYWRldi0+Z2Z4LmNvbmZpZy5zY19wcmltX2Zp
Zm9fc2l6ZV9mcm9udGVuZCA9IDB4MjA7CisJCWFkZXYtPmdmeC5jb25maWcuc2NfcHJpbV9maWZv
X3NpemVfYmFja2VuZCA9IDB4MTAwOworCQlhZGV2LT5nZnguY29uZmlnLnNjX2hpel90aWxlX2Zp
Zm9fc2l6ZSA9IDB4ODA7CisJCWFkZXYtPmdmeC5jb25maWcuc2NfZWFybHl6X3RpbGVfZmlmb19z
aXplID0gMHg0QzA7CisJCWdiX2FkZHJfY29uZmlnID0gUlJFRzMyX1NPQzE1KEdDLCAwLCBtbUdC
X0FERFJfQ09ORklHKTsKKwkJZ2JfYWRkcl9jb25maWcgJj0gfjB4ZjNlNzc3ZmY7CisJCWdiX2Fk
ZHJfY29uZmlnIHw9IDB4MjIwMTAwNDI7CisJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCUJVRygpOwog
CQlicmVhazsKQEAgLTIxMzYsNiArMjE1Niw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfc3dfaW5p
dCh2b2lkICpoYW5kbGUpCiAJY2FzZSBDSElQX1ZFR0EyMDoKIAljYXNlIENISVBfUkFWRU46CiAJ
Y2FzZSBDSElQX0FSQ1RVUlVTOgorCWNhc2UgQ0hJUF9SRU5PSVI6CiAJCWFkZXYtPmdmeC5tZWMu
bnVtX21lYyA9IDI7CiAJCWJyZWFrOwogCWRlZmF1bHQ6CkBAIC0yMjkzLDcgKzIzMTQsNyBAQCBz
dGF0aWMgaW50IGdmeF92OV8wX3N3X2Zpbmkodm9pZCAqaGFuZGxlKQogCWdmeF92OV8wX21lY19m
aW5pKGFkZXYpOwogCWdmeF92OV8wX25nZ19maW5pKGFkZXYpOwogCWFtZGdwdV9ib191bnJlZigm
YWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOwotCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0g
Q0hJUF9SQVZFTikgeworCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZFTiB8fCBhZGV2
LT5hc2ljX3R5cGUgPT0gQ0hJUF9SRU5PSVIpIHsKIAkJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZh
ZGV2LT5nZngucmxjLmNwX3RhYmxlX29iaiwKIAkJCQkmYWRldi0+Z2Z4LnJsYy5jcF90YWJsZV9n
cHVfYWRkciwKIAkJCQkodm9pZCAqKikmYWRldi0+Z2Z4LnJsYy5jcF90YWJsZV9wdHIpOwpAQCAt
Mjk2Myw2ICsyOTg0LDcgQEAgc3RhdGljIGludCBnZnhfdjlfMF9ybGNfcmVzdW1lKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogCiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKIAljYXNl
IENISVBfUkFWRU46CisJY2FzZSBDSElQX1JFTk9JUjoKIAkJaWYgKGFtZGdwdV9sYnB3ID09IDAp
CiAJCQlnZnhfdjlfMF9lbmFibGVfbGJwdyhhZGV2LCBmYWxzZSk7CiAJCWVsc2UKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
