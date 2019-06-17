Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0503848DF7
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAB5892AA;
	Mon, 17 Jun 2019 19:18:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F297893ED
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:53 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j19so12135661qtr.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9zDcHoDAQbylJyRWc0URAI2esWh4Nc/43WpXSccfsrU=;
 b=GgDHQQc2TKuCMT7Edil8k6zg/2kJTIlZTFUKGFX9NX8b0YLeMNnOSGHGo5z7erxTg8
 N/I1H4fiznl05bz6ZJbLKcPmsSXEl1rZvNaqraGvEzGylY3brRRTXwyvCk1uBqBMsPL0
 9xNOWQW0UtzDEcWOAOzZFtR00RCI+BSmtwMrd/2m3xhBfQrvVZbu+cPTYyMOvpLuhj+g
 C6339N/Hs0Pjm2LOG0V7kW1c0uObPRoV8gwm/6oXDVoq6vdTHHZBfYIa5nCe4CiGi4ex
 /+qWO89aXrulz77Hm821XM6x3bScz2ljUkCBlgbYjGS9DEy9QEAEPXfEHIa72YhYBscP
 3bdQ==
X-Gm-Message-State: APjAAAU7znIXQUesZcZbIr9t5MCAAT2OGLTp7ugGHq+goZg5w0pfOGcJ
 CobX+WZXWfLUbCcmRwScT/RwA8IK0+g=
X-Google-Smtp-Source: APXvYqyxmpiJTsbM437aLVYYIIaqRACX97ELPHNcwkwkeTMGnFl/vcz6QsC2ouWowYUFkmmnuzreeg==
X-Received: by 2002:a0c:d0f6:: with SMTP id b51mr1646195qvh.225.1560799071937; 
 Mon, 17 Jun 2019 12:17:51 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 050/459] drm/amdgpu/athub2: enable athub2 clock gating
Date: Mon, 17 Jun 2019 14:10:11 -0500
Message-Id: <20190617191700.17899-39-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9zDcHoDAQbylJyRWc0URAI2esWh4Nc/43WpXSccfsrU=;
 b=PQqL69tzBLChZuXsQlcKH37l+hvdhOJ04ZnkFpCDeaQqUCbY2NIGHG3wRphpkyT/iS
 ySEJXAF7IBOnPyZlxlhDFqPItlscWCmgmSxfZMpkZSSvD63hsMH5fbJLKY9yOVE42ys4
 od38/1H6FgYhUvPH06A/6XEG3EFJwJ/MA6lvS5FKAKzilfs0JLj1g6mpCRtoE1kXlvUd
 KNKXhW1TklmFOARzB7TshvkN5O2J1F2QNy5iQY6YNl/Tym3yLTmBI8weIzNyHJVQLhOt
 BHkg7RKNfg2uUcDj8hLmR+S7lm5TcS8UW2uCTb0RvK4cG+IOsixdYPRSLOJu9oLfXQTB
 kxpA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkVuYWJsZSBhdGh1YjIgY2xvY2sg
Z2F0aW5nIGFuZCBsaWdodCBzbGVlcAoKU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhp
YW9AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlICAgICAgfCAgIDQgKwog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgICB8ICAgMyArCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hdGh1Yl92Ml8wLmMgIHwgMTAxICsrKysrKysrKysrKysrKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdGh1Yl92Ml8wLmggIHwgIDMwICsr
KysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmggfCAgIDIgKwog
NSBmaWxlcyBjaGFuZ2VkLCAxNDAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0aHViX3YyXzAuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0aHViX3YyXzAuaAoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvTWFrZWZpbGUKaW5kZXggZGUyOWQ3YTUxN2QyLi5lZTdlN2I5OWRlYTkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlCkBAIC0xMzUsNiArMTM1LDEwIEBAIGFtZGdwdS15ICs9
IFwKIAlhbWRncHVfdmNuLm8gXAogCXZjbl92MV8wLm8KIAorIyBhZGQgQVRIVUIgYmxvY2sKK2Ft
ZGdwdS15ICs9IFwKKwlhdGh1Yl92Ml8wLm8KKwogIyBhZGQgYW1ka2ZkIGludGVyZmFjZXMKIGFt
ZGdwdS15ICs9IGFtZGdwdV9hbWRrZmQubwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wbS5jCmluZGV4IDA5M2NlZmRhMGNlZi4uNTViNGU2YzIxZjE5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcG0uYwpAQCAtNjQsNiArNjQsOSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGNnX2ZsYWdfbmFtZSBjbG9ja3NbXSA9IHsKIAl7QU1EX0NHX1NVUFBPUlRfRFJNX0xTLCAi
RGlnaXRhbCBSaWdodCBNYW5hZ2VtZW50IExpZ2h0IFNsZWVwIn0sCiAJe0FNRF9DR19TVVBQT1JU
X1JPTV9NR0NHLCAiUm9tIE1lZGl1bSBHcmFpbiBDbG9jayBHYXRpbmcifSwKIAl7QU1EX0NHX1NV
UFBPUlRfREZfTUdDRywgIkRhdGEgRmFicmljIE1lZGl1bSBHcmFpbiBDbG9jayBHYXRpbmcifSwK
KworCXtBTURfQ0dfU1VQUE9SVF9BVEhVQl9NR0NHLCAiQWRkcmVzcyBUcmFuc2xhdGlvbiBIdWIg
TWVkaXVtIEdyYWluIENsb2NrIEdhdGluZyJ9LAorCXtBTURfQ0dfU1VQUE9SVF9BVEhVQl9MUywg
IkFkZHJlc3MgVHJhbnNsYXRpb24gSHViIExpZ2h0IFNsZWVwIn0sCiAJezAsIE5VTEx9LAogfTsK
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRodWJfdjJfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRodWJfdjJfMC5jCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZDNkN2MyMTc2OTMzCi0tLSAvZGV2L251bGwKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRodWJfdjJfMC5jCkBAIC0wLDAgKzEsMTAxIEBA
CisvKgorICogQ29weXJpZ2h0IDIwMTkgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgorICoK
KyAqIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkg
cGVyc29uIG9idGFpbmluZyBhCisgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0
ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLAorICogdG8gZGVhbCBpbiB0
aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRh
dGlvbgorICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gs
IGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsCisgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNv
ZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKKyAqIFNvZnR3YXJlIGlz
IGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6
CisgKgorICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBu
b3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KKyAqIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwg
cG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorICoKKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURF
RCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisgKiBJ
TVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1F
UkNIQU5UQUJJTElUWSwKKyAqIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBO
T05JTkZSSU5HRU1FTlQuICBJTiBOTyBFVkVOVCBTSEFMTAorICogVEhFIENPUFlSSUdIVCBIT0xE
RVIoUykgT1IgQVVUSE9SKFMpIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SCisg
KiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JU
IE9SIE9USEVSV0lTRSwKKyAqIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04g
V0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUgorICogT1RIRVIgREVBTElOR1MgSU4gVEhF
IFNPRlRXQVJFLgorICoKKyAqLworCisjaW5jbHVkZSAiYW1kZ3B1LmgiCisjaW5jbHVkZSAiYXRo
dWJfdjJfMC5oIgorCisjaW5jbHVkZSAiYXRodWIvYXRodWJfMl8wXzBfb2Zmc2V0LmgiCisjaW5j
bHVkZSAiYXRodWIvYXRodWJfMl8wXzBfc2hfbWFzay5oIgorI2luY2x1ZGUgImF0aHViL2F0aHVi
XzJfMF8wX2RlZmF1bHQuaCIKKyNpbmNsdWRlICJuYXZpMTBfZW51bS5oIgorCisjaW5jbHVkZSAi
c29jMTVfY29tbW9uLmgiCisKK3N0YXRpYyB2b2lkCithdGh1Yl92Ml8wX3VwZGF0ZV9tZWRpdW1f
Z3JhaW5fY2xvY2tfZ2F0aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJCQkgICAg
Ym9vbCBlbmFibGUpCit7CisJdWludDMyX3QgZGVmLCBkYXRhOworCisJZGVmID0gZGF0YSA9IFJS
RUczMl9TT0MxNShBVEhVQiwgMCwgbW1BVEhVQl9NSVNDX0NOVEwpOworCisJaWYgKGVuYWJsZSAm
JiAoYWRldi0+Y2dfZmxhZ3MgJiBBTURfQ0dfU1VQUE9SVF9NQ19NR0NHKSkKKwkJZGF0YSB8PSBB
VEhVQl9NSVNDX0NOVExfX0NHX0VOQUJMRV9NQVNLOworCWVsc2UKKwkJZGF0YSAmPSB+QVRIVUJf
TUlTQ19DTlRMX19DR19FTkFCTEVfTUFTSzsKKworCWlmIChkZWYgIT0gZGF0YSkKKwkJV1JFRzMy
X1NPQzE1KEFUSFVCLCAwLCBtbUFUSFVCX01JU0NfQ05UTCwgZGF0YSk7Cit9CisKK3N0YXRpYyB2
b2lkCithdGh1Yl92Ml8wX3VwZGF0ZV9tZWRpdW1fZ3JhaW5fbGlnaHRfc2xlZXAoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCisJCQkJCSAgIGJvb2wgZW5hYmxlKQoreworCXVpbnQzMl90IGRl
ZiwgZGF0YTsKKworCWRlZiA9IGRhdGEgPSBSUkVHMzJfU09DMTUoQVRIVUIsIDAsIG1tQVRIVUJf
TUlTQ19DTlRMKTsKKworCWlmIChlbmFibGUgJiYgKGFkZXYtPmNnX2ZsYWdzICYgQU1EX0NHX1NV
UFBPUlRfTUNfTFMpICYmCisJICAgIChhZGV2LT5jZ19mbGFncyAmIEFNRF9DR19TVVBQT1JUX0hE
UF9MUykpCisJCWRhdGEgfD0gQVRIVUJfTUlTQ19DTlRMX19DR19NRU1fTFNfRU5BQkxFX01BU0s7
CisJZWxzZQorCQlkYXRhICY9IH5BVEhVQl9NSVNDX0NOVExfX0NHX01FTV9MU19FTkFCTEVfTUFT
SzsKKworCWlmKGRlZiAhPSBkYXRhKQorCQlXUkVHMzJfU09DMTUoQVRIVUIsIDAsIG1tQVRIVUJf
TUlTQ19DTlRMLCBkYXRhKTsKK30KKworaW50IGF0aHViX3YyXzBfc2V0X2Nsb2NrZ2F0aW5nKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJICAgICAgIGVudW0gYW1kX2Nsb2NrZ2F0aW5n
X3N0YXRlIHN0YXRlKQoreworCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpCisJCXJldHVybiAw
OworCisJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKKwljYXNlIENISVBfTkFWSTEwOgorCQlh
dGh1Yl92Ml8wX3VwZGF0ZV9tZWRpdW1fZ3JhaW5fY2xvY2tfZ2F0aW5nKGFkZXYsCisJCQkJc3Rh
dGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOworCQlhdGh1Yl92Ml8wX3Vw
ZGF0ZV9tZWRpdW1fZ3JhaW5fbGlnaHRfc2xlZXAoYWRldiwKKwkJCQlzdGF0ZSA9PSBBTURfQ0df
U1RBVEVfR0FURSA/IHRydWUgOiBmYWxzZSk7CisJCWJyZWFrOworCWRlZmF1bHQ6CisJCWJyZWFr
OworCX0KKworCXJldHVybiAwOworfQorCit2b2lkIGF0aHViX3YyXzBfZ2V0X2Nsb2NrZ2F0aW5n
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgKmZsYWdzKQoreworCWludCBkYXRhOwor
CisJLyogQU1EX0NHX1NVUFBPUlRfQVRIVUJfTUdDRyAqLworCWRhdGEgPSBSUkVHMzJfU09DMTUo
QVRIVUIsIDAsIG1tQVRIVUJfTUlTQ19DTlRMKTsKKwlpZiAoZGF0YSAmIEFUSFVCX01JU0NfQ05U
TF9fQ0dfRU5BQkxFX01BU0spCisJCSpmbGFncyB8PSBBTURfQ0dfU1VQUE9SVF9BVEhVQl9NR0NH
OworCisJLyogQU1EX0NHX1NVUFBPUlRfQVRIVUJfTFMgKi8KKwlpZiAoZGF0YSAmIEFUSFVCX01J
U0NfQ05UTF9fQ0dfTUVNX0xTX0VOQUJMRV9NQVNLKQorCQkqZmxhZ3MgfD0gQU1EX0NHX1NVUFBP
UlRfQVRIVUJfTFM7Cit9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
dGh1Yl92Ml8wLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdGh1Yl92Ml8wLmgKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4wMjkzMmMxYzhiYWIKLS0tIC9k
ZXYvbnVsbAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdGh1Yl92Ml8wLmgKQEAg
LTAsMCArMSwzMCBAQAorLyoKKyAqIENvcHlyaWdodCAyMDE5IEFkdmFuY2VkIE1pY3JvIERldmlj
ZXMsIEluYy4KKyAqCisgKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNo
YXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQorICogY29weSBvZiB0aGlzIHNvZnR3YXJl
IGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwKKyAq
IHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3
aXRob3V0IGxpbWl0YXRpb24KKyAqIHRoZSByaWdodHMgdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1l
cmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLAorICogYW5kL29yIHNlbGwgY29w
aWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlCisg
KiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2lu
ZyBjb25kaXRpb25zOgorICoKKyAqIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlz
IHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluCisgKiBhbGwgY29waWVzIG9y
IHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KKyAqCisgKiBUSEUgU09GVFdB
UkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQ
UkVTUyBPUgorICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FS
UkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCisgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIg
UFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAgSU4gTk8gRVZFTlQgU0hBTEwKKyAqIFRIRSBD
T1BZUklHSFQgSE9MREVSKFMpIE9SIEFVVEhPUihTKSBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwg
REFNQUdFUyBPUgorICogT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBD
T05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsCisgKiBBUklTSU5HIEZST00sIE9VVCBPRiBPUiBJ
TiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IKKyAqIE9USEVSIERF
QUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KKyAqCisgKi8KKyNpZm5kZWYgX19BVEhVQl9WMl8wX0hf
XworI2RlZmluZSBfX0FUSFVCX1YyXzBfSF9fCisKK2ludCBhdGh1Yl92Ml8wX3NldF9jbG9ja2dh
dGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCSAgICAgICBlbnVtIGFtZF9jbG9j
a2dhdGluZ19zdGF0ZSBzdGF0ZSk7Cit2b2lkIGF0aHViX3YyXzBfZ2V0X2Nsb2NrZ2F0aW5nKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgKmZsYWdzKTsKKworI2VuZGlmCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaAppbmRleCAxNWZiYjJkZmY0NjIuLjFlNjM4
MzU3YzRhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFy
ZWQuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oCkBAIC05
Niw2ICs5Niw4IEBAIGVudW0gYW1kX3Bvd2VyZ2F0aW5nX3N0YXRlIHsKICNkZWZpbmUgQU1EX0NH
X1NVUFBPUlRfSERQX0RTCQkJKDEgPDwgMjUpCiAjZGVmaW5lIEFNRF9DR19TVVBQT1JUX0hEUF9T
RAkJCSgxIDw8IDI2KQogI2RlZmluZSBBTURfQ0dfU1VQUE9SVF9JSF9DRwkJCSgxIDw8IDI3KQor
I2RlZmluZSBBTURfQ0dfU1VQUE9SVF9BVEhVQl9MUwkJCSgxIDw8IDI4KQorI2RlZmluZSBBTURf
Q0dfU1VQUE9SVF9BVEhVQl9NR0NHCQkoMSA8PCAyOSkKIC8qIFBHIGZsYWdzICovCiAjZGVmaW5l
IEFNRF9QR19TVVBQT1JUX0dGWF9QRwkJCSgxIDw8IDApCiAjZGVmaW5lIEFNRF9QR19TVVBQT1JU
X0dGWF9TTUcJCQkoMSA8PCAxKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
