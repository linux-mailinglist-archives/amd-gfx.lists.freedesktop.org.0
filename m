Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7BD659CA5
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Dec 2022 23:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDF210E100;
	Fri, 30 Dec 2022 22:08:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047A210E100
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Dec 2022 22:08:29 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id kw15so53660767ejc.10
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Dec 2022 14:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DlJEc/hH/t9rib5YBHVwCTIjPCNu7sCIpFI1fEXG8I0=;
 b=KeBhLLbyeHWXFI0PDOQPkvNqCtS21O0mfAJoQciS6ZwK9t5O10jb1bb4925ePNFpYc
 aYUBb0LftZqXjauAj+gyhj17Z+vFOOgtXSZQyzBQfKhqdNCS8EMa28AlM91r7iHInEcN
 SrCjshzIZlIDLwzdoqu3JSn0gnok/ylujpvue208Z59Kwc2RjQgowXBZay35ZcZLWNb6
 sPO9PTsL6ELEt0NQQjHorJ/2DM0pRqt/9XCto7mMal5rvCCbud5PPzPEKwSnWW7bFP9o
 TAgYWwQaEm08tb98u4IH11XzQufQoUdVCNVXqZ4BthxeeNGJPYRmakXs462dOVQYzuiX
 cITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DlJEc/hH/t9rib5YBHVwCTIjPCNu7sCIpFI1fEXG8I0=;
 b=u/Ax0Yzn2rHqeMzj1odjaEfI/vLTZE+vA5HfBu2+msaz2aqfc3zpXVHIXEnG/I5Yl8
 z7wiYNMX1VpriYm5SvlPMp8UnOEYOqKHhOls1qaXrxQKI6pzRImnPZY7oKe+azyydjWU
 ejC5rlG30p0RiggJ3MtV0T95hoL2nBkOxXVnmuDURHqlm8XkliQqu8GYEoOhI5cwTzV4
 qAXjhttWUPK5urtg6bsBWNn7XdZlVZ5Vj/odewxaP7tgy2s0P3OEcMr//KcT/5lzhyxJ
 S40EvyEUmPZLtnVD6n5dn2+ftsTKeEpnMcv2pEx5iRlqwLre1h9y2HK3ELGKOFfGuvkZ
 GfJA==
X-Gm-Message-State: AFqh2kqFcQkXgepo9m1XDdaUrKY4NB2UOvRoH6QLQBajb1GJGXzj/B3u
 6Y6CfCA6CwB25a6VOHOsFNWFV7pkazx89sQb6TSub0YhHVs=
X-Google-Smtp-Source: AMrXdXsJMsDKoNM1pscFPZXhc6zJs6i/j7AU4f/sG2J4dM4lOI5dY/4cnbOYtbIr290eRuk2/dtS/5aSCzntfjX3wbM=
X-Received: by 2002:a17:907:7782:b0:7c0:e380:3d44 with SMTP id
 ky2-20020a170907778200b007c0e3803d44mr2885848ejc.498.1672438107248; Fri, 30
 Dec 2022 14:08:27 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 30 Dec 2022 17:07:51 -0500
Message-ID: <CAAxE2A5su09qWsCekUX4ZzTMAX+9m-BemDxqL2Hh9328Z1WDqw@mail.gmail.com>
Subject: [PATCH 2/2] drm/amdgpu: add AMDGPU_INFO_VM_STAT to return GPU VM
To: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="0000000000004ae5a805f112d713"
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--0000000000004ae5a805f112d713
Content-Type: multipart/alternative; boundary="0000000000004ae5a705f112d711"

--0000000000004ae5a705f112d711
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To give userspace a detailed view about its GPU memory usage and evictions.
This will help performance investigations.

Signed-off-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>

The patch is attached.

Marek

--0000000000004ae5a705f112d711
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">To give userspace a detailed view about its GPU memory usa=
ge and evictions.<br>This will help performance investigations.<br><br><div=
>Signed-off-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak@amd=
.com">marek.olsak@amd.com</a>&gt;</div><div><br></div><div>The patch is att=
ached.</div><div><br></div><div>Marek<br></div></div>

--0000000000004ae5a705f112d711--

--0000000000004ae5a805f112d713
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0002-drm-amdgpu-add-AMDGPU_INFO_VM_STAT-to-return-GPU-VM-.patch"
Content-Disposition: attachment; 
	filename="0002-drm-amdgpu-add-AMDGPU_INFO_VM_STAT-to-return-GPU-VM-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lcb2fw440>
X-Attachment-Id: f_lcb2fw440

RnJvbSAwMWY0MWQ1YjQ5OTIwYjExNDk0Y2EwN2Y2ZGRlMjRlYTMwOThmYTlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/TWFyZWs9MjBPbD1DNT1BMT1DMz1BMWs/PSA8
bWFyZWsub2xzYWtAYW1kLmNvbT4KRGF0ZTogU2F0LCAyNCBEZWMgMjAyMiAxNzo0MTo1MSAtMDUw
MApTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0vYW1kZ3B1OiBhZGQgQU1ER1BVX0lORk9fVk1fU1RB
VCB0byByZXR1cm4gR1BVIFZNCiBzdGF0cyBhYm91dCB0aGUgcHJvY2VzcwpNSU1FLVZlcnNpb246
IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFu
c2Zlci1FbmNvZGluZzogOGJpdAoKVG8gZ2l2ZSB1c2Vyc3BhY2UgYSBkZXRhaWxlZCB2aWV3IGFi
b3V0IGl0cyBHUFUgbWVtb3J5IHVzYWdlIGFuZCBldmljdGlvbnMuClRoaXMgd2lsbCBoZWxwIHBl
cmZvcm1hbmNlIGludmVzdGlnYXRpb25zLgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgT2zFocOhayA8
bWFyZWsub2xzYWtAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMu
YyB8IDEwMSArKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1
X2RybS5oICAgICAgICAgICB8ICAyOSArKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDEzMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jCmluZGV4IDE1NWY5MDViMDBjOS4uZWUxNTMyOTU5MDMyIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCkBAIC0xMDgsOSArMTA4LDEwIEBACiAgKiAtIDMuNTAu
MCAtIFVwZGF0ZSBBTURHUFVfSU5GT19ERVZfSU5GTyBJT0NUTCBmb3IgbWluaW11bSBlbmdpbmUg
YW5kIG1lbW9yeSBjbG9jawogICogICAgICAgICAgICBVcGRhdGUgQU1ER1BVX0lORk9fU0VOU09S
IElPQ1RMIGZvciBQRUFLX1BTVEFURSBlbmdpbmUgYW5kIG1lbW9yeSBjbG9jawogICogICAzLjUx
LjAgLSBSZXR1cm4gdGhlIFBDSWUgZ2VuIGFuZCBsYW5lcyBmcm9tIHRoZSBJTkZPIGlvY3RsCisg
KiAgIDMuNTIuMCAtIEFkZCBBTURHUFVfSU5GT19WTV9TVEFUCiAgKi8KICNkZWZpbmUgS01TX0RS
SVZFUl9NQUpPUgkzCi0jZGVmaW5lIEtNU19EUklWRVJfTUlOT1IJNTEKKyNkZWZpbmUgS01TX0RS
SVZFUl9NSU5PUgk1MgogI2RlZmluZSBLTVNfRFJJVkVSX1BBVENITEVWRUwJMAogCiB1bnNpZ25l
ZCBpbnQgYW1kZ3B1X3ZyYW1fbGltaXQgPSBVSU5UX01BWDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9rbXMuYwppbmRleCBmYmEzMDZlMGVmODcuLjYxOWMzYTYzM2VlNiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwpAQCAtNTE1LDYgKzUxNSw2NyBAQCBz
dGF0aWMgaW50IGFtZGdwdV9od19pcF9pbmZvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAog
CXJldHVybiAwOwogfQogCitzdGF0aWMgdm9pZCBhbWRncHVfdm1fc3RhdF92aXNpdF9ibyhzdHJ1
Y3QgZHJtX2FtZGdwdV9pbmZvX3ZtX3N0YXQgKnN0YXQsCisJCQkJICAgIHN0cnVjdCBhbWRncHVf
Ym9fdmEgKmJvX3ZhKQoreworCXN0cnVjdCBhbWRncHVfYm8gKmJvID0gYm9fdmEtPmJhc2UuYm87
CisJdWludDY0X3Qgc2l6ZTsKKworCWlmICghYm8pCisJCXJldHVybjsKKworCXNpemUgPSBhbWRn
cHVfYm9fc2l6ZShibyk7CisKKwlzd2l0Y2ggKGJvLT50Ym8ucmVzb3VyY2UtPm1lbV90eXBlKSB7
CisJY2FzZSBUVE1fUExfVlJBTToKKwkJaWYgKGJvLT50Ym8uZGVsZXRlZCkgeworCQkJc3RhdC0+
dW5yZWNsYWltZWRfdnJhbSArPSBzaXplOworCQkJc3RhdC0+dW5yZWNsYWltZWRfdnJhbV9ib19j
b3VudCsrOworCQl9IGVsc2UgeworCQkJc3RhdC0+dnJhbSArPSBzaXplOworCQkJc3RhdC0+dnJh
bV9ib19jb3VudCsrOworCisJCQlpZiAoYW1kZ3B1X2JvX2luX2NwdV92aXNpYmxlX3ZyYW0oYm8p
KSB7CisJCQkJc3RhdC0+dmlzaWJsZV92cmFtICs9IHNpemU7CisJCQkJc3RhdC0+dmlzaWJsZV92
cmFtX2JvX2NvdW50Kys7CisJCQl9CisJCX0KKwkJYnJlYWs7CisJY2FzZSBUVE1fUExfVFQ6CisJ
CWlmIChiby0+dGJvLmRlbGV0ZWQpIHsKKwkJCXN0YXQtPnVucmVjbGFpbWVkX2d0dCArPSBzaXpl
OworCQkJc3RhdC0+dW5yZWNsYWltZWRfZ3R0X2JvX2NvdW50Kys7CisJCX0gZWxzZSB7CisJCQlz
dGF0LT5ndHQgKz0gc2l6ZTsKKwkJCXN0YXQtPmd0dF9ib19jb3VudCsrOworCQl9CisJCWJyZWFr
OworCWNhc2UgVFRNX1BMX1NZU1RFTToKKwkJc3RhdC0+c3lzbWVtICs9IHNpemU7CisJCXN0YXQt
PnN5c21lbV9ib19jb3VudCsrOworCQlicmVhazsKKwkvKiBJZ25vcmUgR0RTLCBHV1MsIGFuZCBP
QSAtIHRob3NlIGFyZSBub3QgaW1wb3J0YW50LiAqLworCX0KKworCWlmIChiby0+cHJlZmVycmVk
X2RvbWFpbnMgJiBBTURHUFVfR0VNX0RPTUFJTl9WUkFNKSB7CisJCXN0YXQtPnJlcXVlc3RlZF92
cmFtICs9IHNpemU7CisJCXN0YXQtPnJlcXVlc3RlZF92cmFtX2JvX2NvdW50Kys7CisKKwkJaWYg
KGJvLT50Ym8ucmVzb3VyY2UtPm1lbV90eXBlICE9IFRUTV9QTF9WUkFNKSB7CisJCQlzdGF0LT5l
dmljdGVkX3ZyYW0gKz0gc2l6ZTsKKwkJCXN0YXQtPmV2aWN0ZWRfdnJhbV9ib19jb3VudCsrOwor
CisJCQlpZiAoYm8tPmZsYWdzICYgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0FDQ0VTU19SRVFVSVJF
RCkgeworCQkJCXN0YXQtPmV2aWN0ZWRfdmlzaWJsZV92cmFtICs9IHNpemU7CisJCQkJc3RhdC0+
ZXZpY3RlZF92aXNpYmxlX3ZyYW1fYm9fY291bnQrKzsKKwkJCX0KKwkJfQorCX0gZWxzZSBpZiAo
Ym8tPnByZWZlcnJlZF9kb21haW5zICYgQU1ER1BVX0dFTV9ET01BSU5fR1RUKSB7CisJCXN0YXQt
PnJlcXVlc3RlZF9ndHQgKz0gc2l6ZTsKKwkJc3RhdC0+cmVxdWVzdGVkX2d0dF9ib19jb3VudCsr
OworCX0KK30KKwogLyoKICAqIFVzZXJzcGFjZSBnZXQgaW5mb3JtYXRpb24gaW9jdGwKICAqLwpA
QCAtMTEyOCw2ICsxMTg5LDQ2IEBAIGludCBhbWRncHVfaW5mb19pb2N0bChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHApCiAJCWtmcmVlKGNh
cHMpOwogCQlyZXR1cm4gcjsKIAl9CisJY2FzZSBBTURHUFVfSU5GT19WTV9TVEFUOiB7CisJCXN0
cnVjdCBkcm1fYW1kZ3B1X2luZm9fdm1fc3RhdCBzdGF0ID0ge307CisJCXN0cnVjdCBhbWRncHVf
ZnByaXYgKmZwcml2ID0gZmlscC0+ZHJpdmVyX3ByaXY7CisJCXN0cnVjdCBhbWRncHVfdm0gKnZt
ID0gJmZwcml2LT52bTsKKwkJc3RydWN0IGFtZGdwdV9ib192YSAqYm9fdmEsICp0bXA7CisJCWlu
dCByOworCisJCXIgPSBhbWRncHVfYm9fcmVzZXJ2ZSh2bS0+cm9vdC5ibywgdHJ1ZSk7CisJCWlm
IChyKQorCQkJcmV0dXJuIHI7CisKKwkJc3Bpbl9sb2NrKCZ2bS0+c3RhdHVzX2xvY2spOworCisJ
CWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShib192YSwgdG1wLCAmdm0tPmlkbGUsIGJhc2Uudm1f
c3RhdHVzKSB7CisJCQlhbWRncHVfdm1fc3RhdF92aXNpdF9ibygmc3RhdCwgYm9fdmEpOworCQl9
CisJCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShib192YSwgdG1wLCAmdm0tPmV2aWN0ZWQsIGJh
c2Uudm1fc3RhdHVzKSB7CisJCQlhbWRncHVfdm1fc3RhdF92aXNpdF9ibygmc3RhdCwgYm9fdmEp
OworCQl9CisJCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShib192YSwgdG1wLCAmdm0tPnJlbG9j
YXRlZCwgYmFzZS52bV9zdGF0dXMpIHsKKwkJCWFtZGdwdV92bV9zdGF0X3Zpc2l0X2JvKCZzdGF0
LCBib192YSk7CisJCX0KKwkJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGJvX3ZhLCB0bXAsICZ2
bS0+bW92ZWQsIGJhc2Uudm1fc3RhdHVzKSB7CisJCQlhbWRncHVfdm1fc3RhdF92aXNpdF9ibygm
c3RhdCwgYm9fdmEpOworCQl9CisJCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShib192YSwgdG1w
LCAmdm0tPmludmFsaWRhdGVkLCBiYXNlLnZtX3N0YXR1cykgeworCQkJYW1kZ3B1X3ZtX3N0YXRf
dmlzaXRfYm8oJnN0YXQsIGJvX3ZhKTsKKwkJfQorCQlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUo
Ym9fdmEsIHRtcCwgJnZtLT5kb25lLCBiYXNlLnZtX3N0YXR1cykgeworCQkJYW1kZ3B1X3ZtX3N0
YXRfdmlzaXRfYm8oJnN0YXQsIGJvX3ZhKTsKKwkJfQorCQlsaXN0X2Zvcl9lYWNoX2VudHJ5X3Nh
ZmUoYm9fdmEsIHRtcCwgJnZtLT5mcmVlZCwgYmFzZS52bV9zdGF0dXMpIHsKKwkJCWFtZGdwdV92
bV9zdGF0X3Zpc2l0X2JvKCZzdGF0LCBib192YSk7CisJCX0KKworCQlzcGluX3VubG9jaygmdm0t
PnN0YXR1c19sb2NrKTsKKwkJYW1kZ3B1X2JvX3VucmVzZXJ2ZSh2bS0+cm9vdC5ibyk7CisJCXJl
dHVybiBjb3B5X3RvX3VzZXIob3V0LCAmc3RhdCwKKwkJCQkgICAgbWluKChzaXplX3Qpc2l6ZSwg
c2l6ZW9mKHN0YXQpKSkgPyAtRUZBVUxUIDogMDsKKwl9CiAJZGVmYXVsdDoKIAkJRFJNX0RFQlVH
X0tNUygiSW52YWxpZCByZXF1ZXN0ICVkXG4iLCBpbmZvLT5xdWVyeSk7CiAJCXJldHVybiAtRUlO
VkFMOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmggYi9pbmNsdWRl
L3VhcGkvZHJtL2FtZGdwdV9kcm0uaAppbmRleCBmN2ZjNzMyNWYxN2YuLjUyMWI3Y2EwZmZlOSAx
MDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKKysrIGIvaW5jbHVkZS91
YXBpL2RybS9hbWRncHVfZHJtLmgKQEAgLTg3NSw2ICs4NzUsNyBAQCBzdHJ1Y3QgZHJtX2FtZGdw
dV9jc19jaHVua19kYXRhIHsKIAkjZGVmaW5lIEFNREdQVV9JTkZPX1ZJREVPX0NBUFNfREVDT0RF
CQkwCiAJLyogU3VicXVlcnkgaWQ6IEVuY29kZSAqLwogCSNkZWZpbmUgQU1ER1BVX0lORk9fVklE
RU9fQ0FQU19FTkNPREUJCTEKKyNkZWZpbmUgQU1ER1BVX0lORk9fVk1fU1RBVAkJCTB4MjIKIAog
I2RlZmluZSBBTURHUFVfSU5GT19NTVJfU0VfSU5ERVhfU0hJRlQJMAogI2RlZmluZSBBTURHUFVf
SU5GT19NTVJfU0VfSU5ERVhfTUFTSwkweGZmCkBAIC0xMTU3LDYgKzExNTgsMzQgQEAgc3RydWN0
IGRybV9hbWRncHVfaW5mb192Y2VfY2xvY2tfdGFibGUgewogCV9fdTMyIHBhZDsKIH07CiAKKy8q
IFN0YXRpc3RpY3Mgb2YgdGhlIGN1cnJlbnQgVk0gLSBwZXIgZHJpdmVyIEZELiAqLworc3RydWN0
IGRybV9hbWRncHVfaW5mb192bV9zdGF0IHsKKwkvKiBDdXJyZW50IG1lbW9yeSB1c2FnZS4gdG90
YWwgPSBoZWFwICsgdW5yZWNsYWltZWRfaGVhcC4gKi8KKwlfX3U2NAkJdnJhbTsJCS8qIGluY2x1
ZGVzIHZpc2libGVfdnJhbSAqLworCV9fdTY0CQlndHQ7CisJX191NjQJCXN5c21lbTsKKwlfX3U2
NAkJdW5yZWNsYWltZWRfdnJhbTsgLyogbWFya2VkIGZvciBmcmVlaW5nICovCisJX191NjQJCXVu
cmVjbGFpbWVkX2d0dDsgIC8qIG1hcmtlZCBmb3IgZnJlZWluZyAqLworCS8qIFdoYXQgdXNlcnNw
YWNlIHJlcXVlc3RlZC4gKi8KKwlfX3U2NAkJcmVxdWVzdGVkX3ZyYW07CisJX191NjQJCXJlcXVl
c3RlZF9ndHQ7CisJLyogT3RoZXIgc3RhdHMuICovCisJX191NjQJCXZpc2libGVfdnJhbTsJLyog
aW5jbHVkZWQgaW4gInZyYW0iICovCisJX191NjQJCWV2aWN0ZWRfdnJhbTsJLyogVlJBTSBidWZm
ZXJzIG5vdCBpbiBWUkFNLCBpbmNsLiB2aXNpYmxlIFZSQU0gKi8KKwlfX3U2NAkJZXZpY3RlZF92
aXNpYmxlX3ZyYW07IC8qIHZpc2libGUgVlJBTSBidWZmZXJzIG5vdCBpbiBWUkFNICovCisJLyog
QnVmZmVyIGNvdW50cy4gKi8KKwlfX3UzMiAgICAgICAgICAgdnJhbV9ib19jb3VudDsKKwlfX3Uz
MiAgICAgICAgICAgZ3R0X2JvX2NvdW50OworCV9fdTMyICAgICAgICAgICBzeXNtZW1fYm9fY291
bnQ7CisJX191MzIgICAgICAgICAgIHVucmVjbGFpbWVkX3ZyYW1fYm9fY291bnQ7CisJX191MzIg
ICAgICAgICAgIHVucmVjbGFpbWVkX2d0dF9ib19jb3VudDsKKwlfX3UzMgkJcmVxdWVzdGVkX3Zy
YW1fYm9fY291bnQ7CisJX191MzIJCXJlcXVlc3RlZF9ndHRfYm9fY291bnQ7CisJX191MzIJCXZp
c2libGVfdnJhbV9ib19jb3VudDsKKwlfX3UzMiAgICAgICAgICAgZXZpY3RlZF92cmFtX2JvX2Nv
dW50OworCV9fdTMyICAgICAgICAgICBldmljdGVkX3Zpc2libGVfdnJhbV9ib19jb3VudDsKK307
CisKIC8qIHF1ZXJ5IHZpZGVvIGVuY29kZS9kZWNvZGUgY2FwcyAqLwogI2RlZmluZSBBTURHUFVf
SU5GT19WSURFT19DQVBTX0NPREVDX0lEWF9NUEVHMgkJCTAKICNkZWZpbmUgQU1ER1BVX0lORk9f
VklERU9fQ0FQU19DT0RFQ19JRFhfTVBFRzQJCQkxCi0tIAoyLjI1LjEKCg==
--0000000000004ae5a805f112d713--
