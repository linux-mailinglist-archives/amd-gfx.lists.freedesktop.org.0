Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0619037C85
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 20:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E8A89789;
	Thu,  6 Jun 2019 18:48:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9998967F
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 18:44:48 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i34so3899741qta.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 06 Jun 2019 11:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bW6W0dzfTSD+G2qWpxSPnT6FDkRgs6qYralNDwCWWpM=;
 b=Fu/KmJDwVtwTc58XhXUXeLeG9YFOeQmy6blQvqezU2RO1cN4iaJUmessvfk4hWg+0D
 XreSoxcHVzKATGUnxD3Jm1aMJvEPhVqzhoxDGecjkyRTaWOFX35bZNvNLuecaG3ym1Sj
 +rwx/5hZcr4SJtC0kZVgXNWCltXgQfTgqkVJ0K4hDgzPL8+7PguqM6wlzejzdDLu8Dx6
 bXVJOMXS7RX6jhgKtBpCzkWGIbdyjNvXcrwBTzUCHT/C1TkdIzFczzVKycHZaXWcMZvY
 C4tPthxmloqHW4OkqXjbfE/idTMODJEGmymUSQJK/oNwkXVGfoh80y+dLIqv4tZPMMgb
 DbPg==
X-Gm-Message-State: APjAAAWtTcmD6tT/crhJlaRoRmoXkHcQpAPZ9ePIVzPasSSfbJIIPTNh
 L2bLkCoaglfnVZ+55Hw0jeKB5A==
X-Google-Smtp-Source: APXvYqzZrmfOR3muOAR1prnBDkAE4ixgQwkLWPMt0LNdVl4lLNKXUZcw+vPND9ViR47fQ9OlYet1CA==
X-Received: by 2002:aed:2a43:: with SMTP id k3mr42504564qtf.301.1559846687527; 
 Thu, 06 Jun 2019 11:44:47 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id c5sm1192064qtj.27.2019.06.06.11.44.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 11:44:46 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hYxNV-0008IH-HE; Thu, 06 Jun 2019 15:44:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 03/11] mm/hmm: Hold a mmgrab from hmm to mm
Date: Thu,  6 Jun 2019 15:44:30 -0300
Message-Id: <20190606184438.31646-4-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606184438.31646-1-jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Jun 2019 18:48:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bW6W0dzfTSD+G2qWpxSPnT6FDkRgs6qYralNDwCWWpM=;
 b=EJVyVO6oJlvHu7MqG8ir6ye0d2E52VzdqGkXefNtzJsbNH/e2vUDKVO4zKcSXAEFek
 RGTHSuR2YRZ1JntKN58PGjvSeSfQolEl6TZyDu5mOklbvcsTapHOZDax5t2QrdVtX4to
 S11U99ZURLmGhJncgXoMHt954BFGp+lQHi/nCQ/NGsZzpVCFFG4kyutLM4kf1TOb9nOO
 tio0c5Uz+BelXNUYQJIQjh7rB+6spPYFY8/2kbAPv75GMFedDdWbqiZJxGEeE5bGDsyy
 mjVC0gpMoewb2qe/MbOH7NBFg26yQBOwn3DW+fWWa28YBIKRIyCP/q4ODTS6P3lKmvV+
 taYA==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKU28gbG9uZyBhIGEgc3Ry
dWN0IGhtbSBwb2ludGVyIGV4aXN0cywgc28gc2hvdWxkIHRoZSBzdHJ1Y3QgbW0gaXQgaXMKbGlu
a2VkIHRvby4gSG9sZCB0aGUgbW1ncmFiKCkgYXMgc29vbiBhcyBhIGhtbSBpcyBjcmVhdGVkLCBh
bmQgbW1kcm9wKCkgaXQKb25jZSB0aGUgaG1tIHJlZmNvdW50IGdvZXMgdG8gemVyby4KClNpbmNl
IG1tZHJvcCgpIChpZSBhIDAga3JlZiBvbiBzdHJ1Y3QgbW0pIGlzIG5vdyBpbXBvc3NpYmxlIHdp
dGggYSAhTlVMTAptbS0+aG1tIGRlbGV0ZSB0aGUgaG1tX2htbV9kZXN0cm95KCkuCgpTaWduZWQt
b2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+ClJldmlld2VkLWJ5OiBK
w6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KLS0tCnYyOgogLSBGaXggZXJyb3Ig
dW53aW5kIHBhdGhzIGluIGhtbV9nZXRfb3JfY3JlYXRlIChKZXJvbWUvSmFzb24pCi0tLQogaW5j
bHVkZS9saW51eC9obW0uaCB8ICAzIC0tLQoga2VybmVsL2ZvcmsuYyAgICAgICB8ICAxIC0KIG1t
L2htbS5jICAgICAgICAgICAgfCAyMiArKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9obW0uaCBiL2luY2x1ZGUvbGludXgvaG1tLmgKaW5kZXggMmQ1MTk3OTdjYjEz
NGEuLjRlZTNhY2FiZTVlZDIyIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2htbS5oCisrKyBi
L2luY2x1ZGUvbGludXgvaG1tLmgKQEAgLTU4NiwxNCArNTg2LDExIEBAIHN0YXRpYyBpbmxpbmUg
aW50IGhtbV92bWFfZmF1bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwKIH0KIAogLyogQmVs
b3cgYXJlIGZvciBITU0gaW50ZXJuYWwgdXNlIG9ubHkhIE5vdCB0byBiZSB1c2VkIGJ5IGRldmlj
ZSBkcml2ZXIhICovCi12b2lkIGhtbV9tbV9kZXN0cm95KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKTsK
LQogc3RhdGljIGlubGluZSB2b2lkIGhtbV9tbV9pbml0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQog
ewogCW1tLT5obW0gPSBOVUxMOwogfQogI2Vsc2UgLyogSVNfRU5BQkxFRChDT05GSUdfSE1NX01J
UlJPUikgKi8KLXN0YXRpYyBpbmxpbmUgdm9pZCBobW1fbW1fZGVzdHJveShzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSkge30KIHN0YXRpYyBpbmxpbmUgdm9pZCBobW1fbW1faW5pdChzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSkge30KICNlbmRpZiAvKiBJU19FTkFCTEVEKENPTkZJR19ITU1fTUlSUk9SKSAqLwog
CmRpZmYgLS1naXQgYS9rZXJuZWwvZm9yay5jIGIva2VybmVsL2ZvcmsuYwppbmRleCBiMmI4N2Q0
NTBiODBiNS4uNTg4Yzc2OGFlNzI0NTEgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9mb3JrLmMKKysrIGIv
a2VybmVsL2ZvcmsuYwpAQCAtNjczLDcgKzY3Myw2IEBAIHZvaWQgX19tbWRyb3Aoc3RydWN0IG1t
X3N0cnVjdCAqbW0pCiAJV0FSTl9PTl9PTkNFKG1tID09IGN1cnJlbnQtPmFjdGl2ZV9tbSk7CiAJ
bW1fZnJlZV9wZ2QobW0pOwogCWRlc3Ryb3lfY29udGV4dChtbSk7Ci0JaG1tX21tX2Rlc3Ryb3ko
bW0pOwogCW1tdV9ub3RpZmllcl9tbV9kZXN0cm95KG1tKTsKIAljaGVja19tbShtbSk7CiAJcHV0
X3VzZXJfbnMobW0tPnVzZXJfbnMpOwpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwpp
bmRleCA4Nzk2NDQ3Mjk5MDIzYy4uY2M3YzI2ZmRhMzMwMGUgMTAwNjQ0Ci0tLSBhL21tL2htbS5j
CisrKyBiL21tL2htbS5jCkBAIC0yOSw2ICsyOSw3IEBACiAjaW5jbHVkZSA8bGludXgvc3dhcG9w
cy5oPgogI2luY2x1ZGUgPGxpbnV4L2h1Z2V0bGIuaD4KICNpbmNsdWRlIDxsaW51eC9tZW1yZW1h
cC5oPgorI2luY2x1ZGUgPGxpbnV4L3NjaGVkL21tLmg+CiAjaW5jbHVkZSA8bGludXgvanVtcF9s
YWJlbC5oPgogI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+CiAjaW5jbHVkZSA8bGludXgv
bW11X25vdGlmaWVyLmg+CkBAIC04Miw2ICs4Myw3IEBAIHN0YXRpYyBzdHJ1Y3QgaG1tICpobW1f
Z2V0X29yX2NyZWF0ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSkKIAlobW0tPm5vdGlmaWVycyA9IDA7
CiAJaG1tLT5kZWFkID0gZmFsc2U7CiAJaG1tLT5tbSA9IG1tOworCW1tZ3JhYihobW0tPm1tKTsK
IAogCXNwaW5fbG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7CiAJaWYgKCFtbS0+aG1tKQpAQCAt
MTA5LDYgKzExMSw3IEBAIHN0YXRpYyBzdHJ1Y3QgaG1tICpobW1fZ2V0X29yX2NyZWF0ZShzdHJ1
Y3QgbW1fc3RydWN0ICptbSkKIAkJbW0tPmhtbSA9IE5VTEw7CiAJc3Bpbl91bmxvY2soJm1tLT5w
YWdlX3RhYmxlX2xvY2spOwogZXJyb3I6CisJbW1kcm9wKGhtbS0+bW0pOwogCWtmcmVlKGhtbSk7
CiAJcmV0dXJuIE5VTEw7CiB9CkBAIC0xMzAsNiArMTMzLDcgQEAgc3RhdGljIHZvaWQgaG1tX2Zy
ZWUoc3RydWN0IGtyZWYgKmtyZWYpCiAJCW1tLT5obW0gPSBOVUxMOwogCXNwaW5fdW5sb2NrKCZt
bS0+cGFnZV90YWJsZV9sb2NrKTsKIAorCW1tZHJvcChobW0tPm1tKTsKIAltbXVfbm90aWZpZXJf
Y2FsbF9zcmN1KCZobW0tPnJjdSwgaG1tX2ZyZWVfcmN1KTsKIH0KIApAQCAtMTM4LDI0ICsxNDIs
NiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaG1tX3B1dChzdHJ1Y3QgaG1tICpobW0pCiAJa3JlZl9w
dXQoJmhtbS0+a3JlZiwgaG1tX2ZyZWUpOwogfQogCi12b2lkIGhtbV9tbV9kZXN0cm95KHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tKQotewotCXN0cnVjdCBobW0gKmhtbTsKLQotCXNwaW5fbG9jaygmbW0t
PnBhZ2VfdGFibGVfbG9jayk7Ci0JaG1tID0gbW1fZ2V0X2htbShtbSk7Ci0JbW0tPmhtbSA9IE5V
TEw7Ci0JaWYgKGhtbSkgewotCQlobW0tPm1tID0gTlVMTDsKLQkJaG1tLT5kZWFkID0gdHJ1ZTsK
LQkJc3Bpbl91bmxvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwotCQlobW1fcHV0KGhtbSk7Ci0J
CXJldHVybjsKLQl9Ci0KLQlzcGluX3VubG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7Ci19Ci0K
IHN0YXRpYyB2b2lkIGhtbV9yZWxlYXNlKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLCBzdHJ1Y3Qg
bW1fc3RydWN0ICptbSkKIHsKIAlzdHJ1Y3QgaG1tICpobW0gPSBjb250YWluZXJfb2YobW4sIHN0
cnVjdCBobW0sIG1tdV9ub3RpZmllcik7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
