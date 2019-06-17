Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEF148E06
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0F38951E;
	Mon, 17 Jun 2019 19:18:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCCE894C0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:11 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id d23so12200427qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gatl63tChfl+qX5yyv4txm4uz3kedXMGchdw/gs6Gj0=;
 b=oSLdRW59u84IStI1taK71GE7cV38lGd2Hnuw8N2Gp0pO0TEItKn3Xb26bqqA9dTE9W
 ijfn9NLnail8nft5lKB+wMdJRuc+rCzgC+pMdGba4llrPxhnz0hMKmtBuUR7WCo8rYlc
 /yyLl4VYt9e6wzaVsPsu1kVMhh7OpbH7R0u0dZhCBl7GPX5oZN7UFqXXhsYS47c/VA2Z
 t9968V4+Hc14hCUF1VaLfHShlH9QFpnylMLkzMOoetaHGqthgJfGAqr2AhpHBd3KRSe2
 FA09ODIb2WdxmDTzpPIknOjAEWN+ZtU9G9JNpA+sVMqNWo9La6fW7EL1doCkQnqavcZR
 EnJw==
X-Gm-Message-State: APjAAAX+624WBoi4yk6S3jtCfg/oVmJyof4AZ/HJaYFBlkqwqGiQfTVY
 ZxEomdIFgc72ERj7gjPY8BtyOUAY/p4=
X-Google-Smtp-Source: APXvYqxJIWKrj2f/S1yN1dwyIwzH/ZTYbNyRnMKUEy1++wkG+4QTMZb/4ZnJ8zLpHlq7ERgqrQ+7iA==
X-Received: by 2002:ac8:4619:: with SMTP id p25mr63215710qtn.73.1560799090549; 
 Mon, 17 Jun 2019 12:18:10 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:10 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 070/459] drm/amdgpu: add helper function to print psp hdr
Date: Mon, 17 Jun 2019 14:10:31 -0500
Message-Id: <20190617191700.17899-59-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gatl63tChfl+qX5yyv4txm4uz3kedXMGchdw/gs6Gj0=;
 b=BF8Qwre19LF27bsPqQG1uXfBGhQNO6z537Ju1Fxa8BbpUavexfxsfPT6tj6yMyaLTH
 quzmZy6lEqEO4l1TEEul0kPVMW1mwFhrvFjhodIptT694HZIW1MZgsgoADzMrM5KFDZM
 g4APx2fApWLVUN9nnotyWyX4LwYEIqG4bAgoJa42WEl3vW4RiT2YroCZcP0oQGxFiuLN
 WlsdcEFEZhpUTBOzbx+YaTJYkD7syNHXFa4k0t4JvIABbcZ59EIrMEnFh3VoBiAlRG6H
 0Y08GqOQlWb+5cgIjEvU9tqYBZ9sgDBZuPRJ++xdI80oWIlQTdCqHEhtuHQ6VvYgew8S
 S95A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogTGUg
TWEgPExlLk1hQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dWNvZGUuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdWNvZGUuaCB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91
Y29kZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMKaW5kZXgg
OWY1MGQ2NWIzNTBhLi4wNGQwMDdkYjA2ZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV91Y29kZS5jCkBAIC0yMjcsNiArMjI3LDMwIEBAIHZvaWQgYW1kZ3B1X3Vjb2RlX3By
aW50X3NkbWFfaGRyKGNvbnN0IHN0cnVjdCBjb21tb25fZmlybXdhcmVfaGVhZGVyICpoZHIpCiAJ
fQogfQogCit2b2lkIGFtZGdwdV91Y29kZV9wcmludF9wc3BfaGRyKGNvbnN0IHN0cnVjdCBjb21t
b25fZmlybXdhcmVfaGVhZGVyICpoZHIpCit7CisJdWludDE2X3QgdmVyc2lvbl9tYWpvciA9IGxl
MTZfdG9fY3B1KGhkci0+aGVhZGVyX3ZlcnNpb25fbWFqb3IpOworCXVpbnQxNl90IHZlcnNpb25f
bWlub3IgPSBsZTE2X3RvX2NwdShoZHItPmhlYWRlcl92ZXJzaW9uX21pbm9yKTsKKworCURSTV9E
RUJVRygiUFNQXG4iKTsKKwlhbWRncHVfdWNvZGVfcHJpbnRfY29tbW9uX2hkcihoZHIpOworCisJ
aWYgKHZlcnNpb25fbWFqb3IgPT0gMSkgeworCQljb25zdCBzdHJ1Y3QgcHNwX2Zpcm13YXJlX2hl
YWRlcl92MV8wICpwc3BfaGRyID0KKwkJCWNvbnRhaW5lcl9vZihoZHIsIHN0cnVjdCBwc3BfZmly
bXdhcmVfaGVhZGVyX3YxXzAsIGhlYWRlcik7CisKKwkJRFJNX0RFQlVHKCJ1Y29kZV9mZWF0dXJl
X3ZlcnNpb246ICV1XG4iLAorCQkJICBsZTMyX3RvX2NwdShwc3BfaGRyLT51Y29kZV9mZWF0dXJl
X3ZlcnNpb24pKTsKKwkJRFJNX0RFQlVHKCJzb3Nfb2Zmc2V0X2J5dGVzOiAldVxuIiwKKwkJCSAg
bGUzMl90b19jcHUocHNwX2hkci0+c29zX29mZnNldF9ieXRlcykpOworCQlEUk1fREVCVUcoInNv
c19zaXplX2J5dGVzOiAldVxuIiwKKwkJCSAgbGUzMl90b19jcHUocHNwX2hkci0+c29zX3NpemVf
Ynl0ZXMpKTsKKwl9IGVsc2UgeworCQlEUk1fRVJST1IoIlVua25vd24gUFNQIHVjb2RlIHZlcnNp
b246ICV1LiV1XG4iLAorCQkJICB2ZXJzaW9uX21ham9yLCB2ZXJzaW9uX21pbm9yKTsKKwl9Cit9
CisKIHZvaWQgYW1kZ3B1X3Vjb2RlX3ByaW50X2dwdV9pbmZvX2hkcihjb25zdCBzdHJ1Y3QgY29t
bW9uX2Zpcm13YXJlX2hlYWRlciAqaGRyKQogewogCXVpbnQxNl90IHZlcnNpb25fbWFqb3IgPSBs
ZTE2X3RvX2NwdShoZHItPmhlYWRlcl92ZXJzaW9uX21ham9yKTsKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmgKaW5kZXggYzdhMGU2ZTEzNDEwLi4zODA2YTc5NTdjNmYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oCkBAIC0zMDAsNiAr
MzAwLDcgQEAgdm9pZCBhbWRncHVfdWNvZGVfcHJpbnRfc21jX2hkcihjb25zdCBzdHJ1Y3QgY29t
bW9uX2Zpcm13YXJlX2hlYWRlciAqaGRyKTsKIHZvaWQgYW1kZ3B1X3Vjb2RlX3ByaW50X2dmeF9o
ZHIoY29uc3Qgc3RydWN0IGNvbW1vbl9maXJtd2FyZV9oZWFkZXIgKmhkcik7CiB2b2lkIGFtZGdw
dV91Y29kZV9wcmludF9ybGNfaGRyKGNvbnN0IHN0cnVjdCBjb21tb25fZmlybXdhcmVfaGVhZGVy
ICpoZHIpOwogdm9pZCBhbWRncHVfdWNvZGVfcHJpbnRfc2RtYV9oZHIoY29uc3Qgc3RydWN0IGNv
bW1vbl9maXJtd2FyZV9oZWFkZXIgKmhkcik7Cit2b2lkIGFtZGdwdV91Y29kZV9wcmludF9wc3Bf
aGRyKGNvbnN0IHN0cnVjdCBjb21tb25fZmlybXdhcmVfaGVhZGVyICpoZHIpOwogdm9pZCBhbWRn
cHVfdWNvZGVfcHJpbnRfZ3B1X2luZm9faGRyKGNvbnN0IHN0cnVjdCBjb21tb25fZmlybXdhcmVf
aGVhZGVyICpoZHIpOwogaW50IGFtZGdwdV91Y29kZV92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgZmly
bXdhcmUgKmZ3KTsKIGJvb2wgYW1kZ3B1X3Vjb2RlX2hkcl92ZXJzaW9uKHVuaW9uIGFtZGdwdV9m
aXJtd2FyZV9oZWFkZXIgKmhkciwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
