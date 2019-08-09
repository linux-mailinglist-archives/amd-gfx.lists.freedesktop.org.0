Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D488C87E8D
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DF26EE33;
	Fri,  9 Aug 2019 15:53:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D516EE33
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:11 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id y26so96272849qto.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8wwJtHZSN2T+avcQRPJBMnVKN2BlMgJEuJ5AeUsYnwE=;
 b=W8MQko+Uph76HVttQBqXGFZBEncqUumkIGuh/eB8/OkvdkEQ/ny19ov0HXrHuSvX1d
 wx2uIVofOyDfCQOdcvwGmYGFSmaj3sPnBe2WwFj9tEHDq5epPTsrF6efU8kR7VU9OpL7
 K3mrh5wq/c1e6HpeiG9a3KC/GZn9OWfv9OdYG37WfUhtSAsIdJ17vG8T6k+tu/vlPusL
 O3CGAfjdlNdFQf2zbfpjvqpyCOt9F0o9odjJL0VMcn1DCFAyCyfC4/tQARV/hHX8lrAQ
 Wis9gEfjvMQkHF2EuapKTxqoohA3bUvNbjhzJbppB04GYQRNenQY3xtJW6PJQk9qftmo
 BmAQ==
X-Gm-Message-State: APjAAAVQ9cHxG9/+dsso2ZJH+lLU84kh97YPbqAE1EYo9ELU4+9Uvjb1
 pUpLSVIeUKWWawXnbmEYVZxIhnUg
X-Google-Smtp-Source: APXvYqxfCzsljqS0QJ5L3DaQuXcVMQ73zRmvv+My2YAhjkHpyeTmQazRxuWerkXHgKL67YCbcxZArw==
X-Received: by 2002:ac8:1a68:: with SMTP id q37mr10487304qtk.253.1565365990598; 
 Fri, 09 Aug 2019 08:53:10 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:10 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 00/27] Add Renoir APU support
Date: Fri,  9 Aug 2019 10:52:36 -0500
Message-Id: <20190809155302.4733-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8wwJtHZSN2T+avcQRPJBMnVKN2BlMgJEuJ5AeUsYnwE=;
 b=FnTgUoVB5fCvkOQySPut7W8IwaRMlMEUggfdc3qV6ZTaI+wtOomxafq+M/LJ9qYh7m
 3wu8QLqUuxjpm9Wrn/fiHDiAgD92A9FhKjs5VmEE2PY3gAa5GCOaNuOTPB97DqjZXIde
 19L0iUh29e5e91cAYHYZcbIqarSuQbu+mqku46mWCmV1pMcQVIxGbslSGReE73gRRZME
 mA9hzooVFzMNYP61/7RKYcCINgIMRf6p5qGnd1mJaOdqIV07vuKpdfjKQ3sRHE7Ecmnk
 4cAwmKdVqD6Wk1YtTBIjuGziwnqzuVXgiIR3jbhRCsbsbSSEKMYT4Tvn8Bya1Kc31gb6
 3lJw==
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

VGhpcyBwYXRjaCBzZXQgcHJvdmlkZXMgaW5pdGlhbCBzdXBwb3J0IGZvciBhIG5ldyBBUFUsCnJl
bm9pci4KCkFhcm9uIExpdSAoOSk6CiAgZHJtL2FtZGdwdTogZml4IG5vIGludGVycnVwdCBpc3N1
ZSBmb3IgcmVub2lyIGVtdQogIGRybS9hbWRncHU6IGVuYWJsZSBkY2UgdmlydHVhbCBpcCBtb2R1
bGUgZm9yIFJlbm9pcgogIGRybS9hbWRncHU6IGFkZCBhc2ljIGZ1bmNzIGZvciByZW5vaXIKICBk
cm0vYW1kZ3B1OiBzZXQgcmxjIGZ1bmNzIGZvciByZW5vaXIKICBkcm0vYW1kZ3B1OiBhZGQgcHNw
X3YxMl8wIGZvciByZW5vaXIgKHYyKQogIGRybS9hbWRncHU6IGVuYWJsZSBjbG9jayBnYXRpbmcg
Zm9yIHJlbm9pcgogIGRybS9hbWRncHU6IGVuYWJsZSBwb3dlciBnYXRpbmcgZm9yIHJlbm9pcgog
IGRybS9hbWRncHU6IHVwZGF0ZSBsYnB3IGZvciByZW5vaXIKICBkcm0vYW1kZ3B1OiBzZXQgZncg
ZGVmYXVsdCBsb2FkaW5nIGJ5IHBzcCBmb3IgcmVub2lyCgpBbGV4IERldWNoZXIgKDEpOgogIGRy
bS9hbWRncHU6IGZsYWcgcmVub2lyIGFzIGV4cGVyaW1lbnRhbCBmb3Igbm93CgpIdWFuZyBSdWkg
KDE0KToKICBkcm0vYW1kZ3B1OiBhZGQgcmVub2lyIGhlYWRlciBmaWxlcyAodjIpCiAgZHJtL2Ft
ZGdwdTogYWRkIHJlbm9pciBhc2ljX3R5cGUgZW51bQogIGRybS9hbWRncHU6IGFkZCByZW5vaXIg
c3VwcG9ydCBmb3IgZ3B1X2luZm8gYW5kIGlwIGJsb2NrIHNldHRpbmcKICBkcm0vYW1kZ3B1OiBh
ZGQgc29jMTUgY29tbW9uIGlwIGJsb2NrIHN1cHBvcnQgZm9yIHJlbm9pcgogIGRybS9hbWRncHU6
IGFkZCBnbWMgdjkgc3VwcG9ydHMgZm9yIHJlbm9pcgogIGRybS9hbWRncHU6IHNldCBmdyBsb2Fk
IHR5cGUgZm9yIHJlbm9pcgogIGRybS9hbWRncHU6IGFkZCBnZnggc3VwcG9ydCBmb3IgcmVub2ly
CiAgZHJtL2FtZGdwdTogYWRkIHNkbWEgc3VwcG9ydCBmb3IgcmVub2lyCiAgZHJtL2FtZGdwdTog
c2V0IGlwIGJsb2NrcyBmb3IgcmVub2lyCiAgZHJtL2FtZGdwdTogYWRkIHJlbm9pciBwY2kgaWQK
ICBkcm0vYW1kZ3B1OiBhZGQgZ2Z4IGdvbGRlbiBzZXR0aW5ncyBmb3IgcmVub2lyICh2MikKICBk
cm0vYW1kZ3B1OiBhZGQgc2RtYSBnb2xkZW4gc2V0dGluZ3MgZm9yIHJlbm9pcgogIGRybS9hbWRn
cHU6IHVzZSBkaXJlY3QgbG9hZGluZyBvbiByZW5vaXIgdmNuIGZvciB0aGUgbW9tZW50CiAgZHJt
L2FtZGdwdTogc2tpcCBtZWMyIGp1bXAgdGFibGUgbG9hZGluZyBmb3IgcmVub2lyCgpMZW8gTGl1
ICgzKToKICBkcm0vYW1kZ3B1OiBlbmFibGUgUmVub2lyIFZDTiBmaXJtd2FyZSBsb2FkaW5nCiAg
ZHJtL2FtZGdwdTogZW5hYmxlIERvb3JiZWxsIHN1cHBvcnQgZm9yIFJlbm9pciAodjIpCiAgZHJt
L2FtZGdwdTogYWRkIFZDTjIuMCB0byBSZW5vaXIgSVAgYmxvY2tzCgogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvTWFrZWZpbGUgICAgICAgICAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgICAgfCAgIDkgKy0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgICAgICB8ICAgMyArCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcHNwLmMgICAgICAgfCAgMTcgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BzcC5oICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV91Y29kZS5jICAgICB8ICAgMiArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdmNuLmMgICAgICAgfCAgMTcgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2RjZV92aXJ0dWFsLmMgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjlfMC5jICAgICAgICAgfCAgNTYgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMgICAgICAgICB8ICAgNyArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlv
X3Y3XzAuYyAgICAgICAgfCAgMjEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3Yx
Ml8wLmMgICAgICAgIHwgNTY1ICsrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvcHNwX3YxMl8wLmggICAgICAgIHwgIDMwICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NkbWFfdjRfMC5jICAgICAgICB8ICAyMyArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c29jMTUuYyAgICAgICAgICAgIHwgIDIxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zj
bl92Ml8wLmMgICAgICAgICB8ICAgOSArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVn
YTEwX2loLmMgICAgICAgIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdh
MTBfcmVnX2luaXQuYyAgfCAgIDQgKwogLi4uL2luY2x1ZGUvYXNpY19yZWcvbXAvbXBfMTJfMF8w
X29mZnNldC5oICAgIHwgMzM2ICsrKysrKysKIC4uLi9pbmNsdWRlL2FzaWNfcmVnL21wL21wXzEy
XzBfMF9zaF9tYXNrLmggICB8IDg2NiArKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2Ft
ZF9hc2ljX3R5cGUuaCAgICAgICAgICAgICAgICAgICB8ICAgMSArCiAyMSBmaWxlcyBjaGFuZ2Vk
LCAxOTgyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTJfMC5jCiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMl8wLmgKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvbXAvbXBfMTJfMF8wX29m
ZnNldC5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Fz
aWNfcmVnL21wL21wXzEyXzBfMF9zaF9tYXNrLmgKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
