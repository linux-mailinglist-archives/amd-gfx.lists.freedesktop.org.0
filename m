Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB217E42C
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB476E7D8;
	Thu,  1 Aug 2019 20:30:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803AC6E7D8
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:23 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id r6so67433731qtt.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MfeY5+2j38HgBKiOAw7t57o5z4keUwysF9YgODjznmo=;
 b=CFN6jJobUpDfp/HiPO25RofubzQ4QaKi4JQc8GG+JdXSq4WLKcv2IB/k3yHDAWI4ra
 APdnfrDQhLd9bxIgDgfFb8Ee9zuU0TSSBnvQVtqAnMJ+XpPZ/jhj0diOaIFcOIeijWhP
 mPCzbsbcnxR1VuiHLCju4KK0/ieov0oydTdKp0RiA8t5zVon7G2iN1kM17Y89+26IOlX
 ydfdfhcuK8X+ZIJsMPzWJxaVOGSRAsMSDKv7ltoIY0L2k4XAKo0xBZyV25bOEzoF/W5a
 Uy5/oT+xHFAISHTTQJGgMKVGTmIfKMh9nFI51b+cw6/c84th4lwBOwxm6WnN9gbNiHOp
 UM7w==
X-Gm-Message-State: APjAAAW3fQAZH7b8QYgKj4UqJCsUJwQ/z+id/5PIh2FfJD7e4JpeBIus
 8yJEDDIQLC5uyWrAosDl2RqpIcTH
X-Google-Smtp-Source: APXvYqz6dT5V0da7Y3z6Z7RfbrNd/mtAXvkeWj7YMlT0XXsXyT55NhbiKFnieB3GBiuKiEvRkGIgDA==
X-Received: by 2002:ac8:2b62:: with SMTP id 31mr93173801qtv.140.1564691422396; 
 Thu, 01 Aug 2019 13:30:22 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:21 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 19/36] drm/amdgpu/gfx10: set tcp harvest for navi12
Date: Thu,  1 Aug 2019 15:29:40 -0500
Message-Id: <20190801202957.29791-20-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MfeY5+2j38HgBKiOAw7t57o5z4keUwysF9YgODjznmo=;
 b=tYkh7Bw0Hl9mF47TwLZEflv0+H9o+rmZO586kxB71IzF2UsjKPKRl+MtYTbWMofZXr
 hdKcluEq4DjNOlyF7tMhKJNcyg2QvfnMZd4g53QGezGP2vkInK2CEz6MItNFeL/+38ft
 OC4PyK5bJP0esikOiZ20Sfa/dKqtDl7u0hoMJskpC5hO5FLXDxOufKzJ4AU8a75K0fAU
 G4c8yGNMixUF1fj3FUUJ7KpQXcgaZ8tRyhms4i8A30grdgSz8NPjcAxoJoQD5pIPQOff
 z7TUR7wPsIRZstY13fExYY7DTFXXHoF/2b4tkWe15ivIl0lzBSVgCRr45xXwq9f1+Qyn
 q/4w==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNhbWUgYXMgbmF2aTEw
LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgOCArKysrKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92MTBfMC5jCmluZGV4IDY1ZTcxMjUxOTkxNC4uMmVlZGU1ZWE5N2E0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwpAQCAtMTU2Myw3ICsxNTYzLDcgQEAg
c3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3RjcF9oYXJ2ZXN0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogCXUzMiB1dGNsX2ludnJlcV9kaXNhYmxlID0gMDsKIAkvKgogCSAqIEdDUkRfVEFSR0VU
U19ESVNBQkxFIGZpZWxkIGNvbnRhaW5zCi0JICogZm9yIE5hdmkxMDogR0wxQz1bMTg6MTVdLCBT
UUM9WzE0OjEwXSwgVENQPVs5OjBdCisJICogZm9yIE5hdmkxMC9OYXZpMTI6IEdMMUM9WzE4OjE1
XSwgU1FDPVsxNDoxMF0sIFRDUD1bOTowXQogCSAqIGZvciBOYXZpMTQ6IEdMMUM9WzIxOjE4XSwg
U1FDPVsxNzoxMl0sIFRDUD1bMTE6MF0KIAkgKi8KIAl1MzIgZ2NyZF90YXJnZXRzX2Rpc2FibGVf
bWFzayA9IGFtZGdwdV9nZnhfY3JlYXRlX2JpdG1hc2soCkBAIC0xNTcyLDcgKzE1NzIsNyBAQCBz
dGF0aWMgdm9pZCBnZnhfdjEwXzBfdGNwX2hhcnZlc3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJCQk0KTsgLyogR0wxQyAqLwogCS8qCiAJICogVVRDTDFfVVRDTDBfSU5WUkVRX0RJU0FC
TEUgZmllbGQgY29udGFpbnMKLQkgKiBmb3IgTmF2aTEwOiBTUUc9WzI0XSwgUk1JPVsyMzoyMF0s
IFNRQz1bMTk6MTBdLCBUQ1A9Wzk6MF0KKwkgKiBmb3IgTmF2aTEwTmF2aTEyOiBTUUc9WzI0XSwg
Uk1JPVsyMzoyMF0sIFNRQz1bMTk6MTBdLCBUQ1A9Wzk6MF0KIAkgKiBmb3IgTmF2aTE0OiBTUUc9
WzI4XSwgUk1JPVsyNzoyNF0sIFNRQz1bMjM6MTJdLCBUQ1A9WzExOjBdCiAJICovCiAJdTMyIHV0
Y2xfaW52cmVxX2Rpc2FibGVfbWFzayA9IGFtZGdwdV9nZnhfY3JlYXRlX2JpdG1hc2soCkBAIC0x
NTgxLDcgKzE1ODEsOSBAQCBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfdGNwX2hhcnZlc3Qoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQk0ICsgLyogUk1JICovCiAJCQkxKTsgLyogU1FHICov
CiAKLQlpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfTkFWSTEwIHx8IGFkZXYtPmFzaWNfdHlw
ZSA9PSBDSElQX05BVkkxNCkgeworCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9OQVZJMTAg
fHwKKwkgICAgYWRldi0+YXNpY190eXBlID09IENISVBfTkFWSTE0IHx8CisJICAgIGFkZXYtPmFz
aWNfdHlwZSA9PSBDSElQX05BVkkxMikgewogCQltdXRleF9sb2NrKCZhZGV2LT5ncmJtX2lkeF9t
dXRleCk7CiAJCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5nZnguY29uZmlnLm1heF9zaGFkZXJfZW5n
aW5lczsgaSsrKSB7CiAJCQlmb3IgKGogPSAwOyBqIDwgYWRldi0+Z2Z4LmNvbmZpZy5tYXhfc2hf
cGVyX3NlOyBqKyspIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
