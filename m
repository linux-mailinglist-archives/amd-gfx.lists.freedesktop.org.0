Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AF898718
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658696E9AB;
	Wed, 21 Aug 2019 22:24:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5576E9A7
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:15 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id t12so5089983qtp.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QF0diNHdh4akVjv826po9iEy0zPK9o+DeejfBsP59hg=;
 b=SFmzsABzAcjb7QSRz79DX6EUi7MoB3Qn0RPNiH962qKDL8kq258PHO+0MuNXgZ+uBO
 vu0u2KnDt+fijPTvCKGrTy/y2pm4KIrAOA/GAOsoYVYp7y1ljrBsvy6F1Egp7IZhrQWl
 1j1nUC13oCrlnWiRagb9kiEu7F8vgaw7Pi9W87rHQvEPvMWj0xj+lBYnjfnPrI6DQp19
 Ypy83CErBISaIxJ1HfLa9GEEZMejNI4H4/4iMfshbANbABMu8uGi0cGPNcyQgWl4PeQq
 MueXWL0MzXIiY1mWqB5mSnqUwAcYBw+CSsWK7ieilXtNK18cOTsyAnS8yUWch+zReXLC
 f7XQ==
X-Gm-Message-State: APjAAAWR3PkeSsU6+JLZosfldXNegX2iBGJWCsc3qsQvrw7xPa6aaoGR
 NqLHB73klTVCHuzmeWmMg2+JiptS
X-Google-Smtp-Source: APXvYqyqOLpCr1RZ16hX/OWK/UCYD2AY6GON3CjAquXaIzSw25GmGoxzhadgovFHnuWMltxUw/9dTQ==
X-Received: by 2002:a0c:8602:: with SMTP id p2mr19801558qva.111.1566426254529; 
 Wed, 21 Aug 2019 15:24:14 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 04/37] drm/amdgpu/powerplay: add smu_v12_0.c & smu_v12_0.h for
 renoir
Date: Wed, 21 Aug 2019 17:23:26 -0500
Message-Id: <20190821222359.13578-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QF0diNHdh4akVjv826po9iEy0zPK9o+DeejfBsP59hg=;
 b=DGiq2ginEU4QW+WcZmQo2AEWvi91ymiHN8ccMlK1xJxfgb7gqez8VRBlAebMl/KLJr
 XVBlYpRZBXwuWVNvVl5NZfPLld4ZZEf6cZk8vTatMoMzPoGeXkyiEBnmg8gwn33eo5rP
 ZBX536STa4r3aRnC16g0uQu7aIkvBLhYNRrmfOg685DMxcaxhvV2risRi05jWTYRnZa9
 0EFYMuZMA+3CJRqc/+WYUDsTPE1/VIiNUPIgWZf7JvhMyWx/nGxu26FPFWoQcgWguXey
 894SgWXhZJ7A4imUW2VlzYyU1w4n135K/GWbWN2jlmForzHSoD1SsHQkvlNkGCkeIsI0
 iS+w==
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
 Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KCmFkZCBzbXVfdjEyXzAuYyAmIHNt
dV92MTJfMC5oIGZvciByZW5vaXIKClNpZ25lZC1vZmYtYnk6IEFhcm9uIExpdSA8YWFyb24ubGl1
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTJfMC5oIHwgIDM3ICsrKysK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTJfMC5jICAgICB8IDE3MCArKysr
KysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjA3IGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3YxMl8w
LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVf
djEyXzAuYwoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9z
bXVfdjEyXzAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXVfdjEyXzAu
aApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjI3OGNkYzJjMGQ0Nwot
LS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXVf
djEyXzAuaApAQCAtMCwwICsxLDM3IEBACisvKgorICogQ29weXJpZ2h0IDIwMTkgQWR2YW5jZWQg
TWljcm8gRGV2aWNlcywgSW5jLgorICoKKyAqIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQs
IGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhCisgKiBjb3B5IG9mIHRo
aXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0
d2FyZSIpLAorICogdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwg
aW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbgorICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHks
IG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsCisgKiBhbmQv
b3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8g
d2hvbSB0aGUKKyAqIFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0
aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisgKgorICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3Rp
Y2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KKyAqIGFs
bCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorICoKKyAq
IFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFO
WSBLSU5ELCBFWFBSRVNTIE9SCisgKiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVE
IFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyAqIEZJVE5FU1MgRk9SIEEg
UEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuICBJTiBOTyBFVkVOVCBTSEFM
TAorICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykgT1IgQVVUSE9SKFMpIEJFIExJQUJMRSBGT1Ig
QU5ZIENMQUlNLCBEQU1BR0VTIE9SCisgKiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4g
QUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwKKyAqIEFSSVNJTkcgRlJPTSwg
T1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUgor
ICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgorICoKKyAqLworI2lmbmRlZiBfX1NN
VV9WMTJfMF9IX18KKyNkZWZpbmUgX19TTVVfVjEyXzBfSF9fCisKKyNpbmNsdWRlICJhbWRncHVf
c211LmgiCisKKy8qIE1QIEFwZXJ0dXJlcyAqLworI2RlZmluZSBNUDBfUHVibGljCQkJMHgwMzgw
MDAwMAorI2RlZmluZSBNUDBfU1JBTQkJCTB4MDM5MDAwMDAKKyNkZWZpbmUgTVAxX1B1YmxpYwkJ
CTB4MDNiMDAwMDAKKyNkZWZpbmUgTVAxX1NSQU0JCQkweDAzYzAwMDA0CisKKwordm9pZCBzbXVf
djEyXzBfc2V0X3NtdV9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7CisKKyNlbmRpZgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMl8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEyXzAuYwpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmZkYWZhMjMwNmMyOQotLS0gL2Rldi9udWxsCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTJfMC5jCkBAIC0wLDAgKzEsMTcw
IEBACisvKgorICogQ29weXJpZ2h0IDIwMTkgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgor
ICoKKyAqIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBh
bnkgcGVyc29uIG9idGFpbmluZyBhCisgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29j
aWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLAorICogdG8gZGVhbCBp
biB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGlt
aXRhdGlvbgorICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxp
c2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsCisgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhl
IFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKKyAqIFNvZnR3YXJl
IGlzIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlv
bnM6CisgKgorICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lv
biBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KKyAqIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRp
YWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorICoKKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9W
SURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisg
KiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9G
IE1FUkNIQU5UQUJJTElUWSwKKyAqIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFO
RCBOT05JTkZSSU5HRU1FTlQuICBJTiBOTyBFVkVOVCBTSEFMTAorICogVEhFIENPUFlSSUdIVCBI
T0xERVIoUykgT1IgQVVUSE9SKFMpIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9S
CisgKiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBU
T1JUIE9SIE9USEVSV0lTRSwKKyAqIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJ
T04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUgorICogT1RIRVIgREVBTElOR1MgSU4g
VEhFIFNPRlRXQVJFLgorICovCisKKyNpbmNsdWRlICJwcF9kZWJ1Zy5oIgorI2luY2x1ZGUgPGxp
bnV4L2Zpcm13YXJlLmg+CisjaW5jbHVkZSAiYW1kZ3B1LmgiCisjaW5jbHVkZSAiYW1kZ3B1X3Nt
dS5oIgorI2luY2x1ZGUgImF0b21maXJtd2FyZS5oIgorI2luY2x1ZGUgImFtZGdwdV9hdG9tZmly
bXdhcmUuaCIKKyNpbmNsdWRlICJzbXVfdjEyXzAuaCIKKyNpbmNsdWRlICJzb2MxNV9jb21tb24u
aCIKKyNpbmNsdWRlICJhdG9tLmgiCisjaW5jbHVkZSAicmVub2lyX3BwdC5oIgorCisjaW5jbHVk
ZSAiYXNpY19yZWcvbXAvbXBfMTJfMF8wX29mZnNldC5oIgorI2luY2x1ZGUgImFzaWNfcmVnL21w
L21wXzEyXzBfMF9zaF9tYXNrLmgiCisKKyNkZWZpbmUgc21uTVAxX0ZJUk1XQVJFX0ZMQUdTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDMwMTAwMjQKKworc3RhdGljIGludCBzbXVf
djEyXzBfc2VuZF9tc2dfd2l0aG91dF93YWl0aW5nKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAor
CQkJCQkgICAgICB1aW50MTZfdCBtc2cpCit7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYg
PSBzbXUtPmFkZXY7CisKKwlXUkVHMzJfU09DMTUoTVAxLCAwLCBtbU1QMV9TTU5fQzJQTVNHXzY2
LCBtc2cpOworCXJldHVybiAwOworfQorCitzdGF0aWMgaW50IHNtdV92MTJfMF9yZWFkX2FyZyhz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgKmFyZykKK3sKKwlzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiA9IHNtdS0+YWRldjsKKworCSphcmcgPSBSUkVHMzJfU09DMTUoTVAxLCAw
LCBtbU1QMV9TTU5fQzJQTVNHXzgyKTsKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGludCBzbXVf
djEyXzBfd2FpdF9mb3JfcmVzcG9uc2Uoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCit7CisJc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7CisJdWludDMyX3QgY3VyX3ZhbHVl
LCBpOworCisJZm9yIChpID0gMDsgaSA8IGFkZXYtPnVzZWNfdGltZW91dDsgaSsrKSB7CisJCWN1
cl92YWx1ZSA9IFJSRUczMl9TT0MxNShNUDEsIDAsIG1tTVAxX1NNTl9DMlBNU0dfOTApOworCQlp
ZiAoKGN1cl92YWx1ZSAmIE1QMV9DMlBNU0dfOTBfX0NPTlRFTlRfTUFTSykgIT0gMCkKKwkJCWJy
ZWFrOworCQl1ZGVsYXkoMSk7CisJfQorCisJLyogdGltZW91dCBtZWFucyB3cm9uZyBsb2dpYyAq
LworCWlmIChpID09IGFkZXYtPnVzZWNfdGltZW91dCkKKwkJcmV0dXJuIC1FVElNRTsKKworCXJl
dHVybiBSUkVHMzJfU09DMTUoTVAxLCAwLCBtbU1QMV9TTU5fQzJQTVNHXzkwKSA9PSAweDEgPyAw
IDogLUVJTzsKK30KKworc3RhdGljIGludCBzbXVfdjEyXzBfc2VuZF9tc2coc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUsIHVpbnQxNl90IG1zZykKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diA9IHNtdS0+YWRldjsKKwlpbnQgcmV0ID0gMCwgaW5kZXggPSAwOworCisJaW5kZXggPSBzbXVf
bXNnX2dldF9pbmRleChzbXUsIG1zZyk7CisJaWYgKGluZGV4IDwgMCkKKwkJcmV0dXJuIGluZGV4
OworCisJc211X3YxMl8wX3dhaXRfZm9yX3Jlc3BvbnNlKHNtdSk7CisKKwlXUkVHMzJfU09DMTUo
TVAxLCAwLCBtbU1QMV9TTU5fQzJQTVNHXzkwLCAwKTsKKworCXNtdV92MTJfMF9zZW5kX21zZ193
aXRob3V0X3dhaXRpbmcoc211LCAodWludDE2X3QpaW5kZXgpOworCisJcmV0ID0gc211X3YxMl8w
X3dhaXRfZm9yX3Jlc3BvbnNlKHNtdSk7CisKKwlpZiAocmV0KQorCQlwcl9lcnIoIkZhaWxlZCB0
byBzZW5kIG1lc3NhZ2UgMHgleCwgcmVzcG9uc2UgMHgleFxuIiwgaW5kZXgsCisJCSAgICAgICBy
ZXQpOworCisJcmV0dXJuIHJldDsKKworfQorCitzdGF0aWMgaW50CitzbXVfdjEyXzBfc2VuZF9t
c2dfd2l0aF9wYXJhbShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDE2X3QgbXNnLAorCQkJ
ICAgICAgdWludDMyX3QgcGFyYW0pCit7CisKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9
IHNtdS0+YWRldjsKKwlpbnQgcmV0ID0gMCwgaW5kZXggPSAwOworCisJaW5kZXggPSBzbXVfbXNn
X2dldF9pbmRleChzbXUsIG1zZyk7CisJaWYgKGluZGV4IDwgMCkKKwkJcmV0dXJuIGluZGV4Owor
CisJcmV0ID0gc211X3YxMl8wX3dhaXRfZm9yX3Jlc3BvbnNlKHNtdSk7CisJaWYgKHJldCkKKwkJ
cHJfZXJyKCJGYWlsZWQgdG8gc2VuZCBtZXNzYWdlIDB4JXgsIHJlc3BvbnNlIDB4JXgsIHBhcmFt
IDB4JXhcbiIsCisJCSAgICAgICBpbmRleCwgcmV0LCBwYXJhbSk7CisKKwlXUkVHMzJfU09DMTUo
TVAxLCAwLCBtbU1QMV9TTU5fQzJQTVNHXzkwLCAwKTsKKworCVdSRUczMl9TT0MxNShNUDEsIDAs
IG1tTVAxX1NNTl9DMlBNU0dfODIsIHBhcmFtKTsKKworCXNtdV92MTJfMF9zZW5kX21zZ193aXRo
b3V0X3dhaXRpbmcoc211LCAodWludDE2X3QpaW5kZXgpOworCisJcmV0ID0gc211X3YxMl8wX3dh
aXRfZm9yX3Jlc3BvbnNlKHNtdSk7CisJaWYgKHJldCkKKwkJcHJfZXJyKCJGYWlsZWQgdG8gc2Vu
ZCBtZXNzYWdlIDB4JXgsIHJlc3BvbnNlIDB4JXggcGFyYW0gMHgleFxuIiwKKwkJICAgICAgIGlu
ZGV4LCByZXQsIHBhcmFtKTsKKworCXJldHVybiByZXQ7Cit9CisKK3N0YXRpYyBpbnQgc211X3Yx
Ml8wX2NoZWNrX2Z3X3ZlcnNpb24oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCit7CisJdWludDMy
X3Qgc211X3ZlcnNpb24gPSAweGZmOworCWludCByZXQgPSAwOworCisJcmV0ID0gc211X3NlbmRf
c21jX21zZyhzbXUsIFNNVV9NU0dfR2V0RHJpdmVySWZWZXJzaW9uKTsKKwlpZiAocmV0KQorCQln
b3RvIGVycjsKKworCXJldCA9IHNtdV9yZWFkX3NtY19hcmcoc211LCAmc211X3ZlcnNpb24pOwor
CWlmIChyZXQpCisJCWdvdG8gZXJyOworCisJaWYgKHNtdV92ZXJzaW9uICE9IHNtdS0+c21jX2lm
X3ZlcnNpb24pCisJCXJldCA9IC1FSU5WQUw7CitlcnI6CisJcmV0dXJuIHJldDsKK30KKworc3Rh
dGljIGNvbnN0IHN0cnVjdCBzbXVfZnVuY3Mgc211X3YxMl8wX2Z1bmNzID0geworCS5jaGVja19m
d192ZXJzaW9uID0gc211X3YxMl8wX2NoZWNrX2Z3X3ZlcnNpb24sCisJLnNlbmRfc21jX21zZyA9
IHNtdV92MTJfMF9zZW5kX21zZywKKwkuc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0gPSBzbXVfdjEy
XzBfc2VuZF9tc2dfd2l0aF9wYXJhbSwKKwkucmVhZF9zbWNfYXJnID0gc211X3YxMl8wX3JlYWRf
YXJnLAorfTsKKwordm9pZCBzbXVfdjEyXzBfc2V0X3NtdV9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSkKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHNtdS0+YWRldjsKKwor
CXNtdS0+ZnVuY3MgPSAmc211X3YxMl8wX2Z1bmNzOworCisJc3dpdGNoIChhZGV2LT5hc2ljX3R5
cGUpIHsKKwljYXNlIENISVBfUkVOT0lSOgorCQlyZW5vaXJfc2V0X3BwdF9mdW5jcyhzbXUpOwor
CQlicmVhazsKKwlkZWZhdWx0OgorCQlwcl93YXJuKCJVbmtub3duIGFzaWMgZm9yIHNtdTEyXG4i
KTsKKwl9Cit9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
