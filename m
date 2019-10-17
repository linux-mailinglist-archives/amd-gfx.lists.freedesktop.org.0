Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D26DA2D2
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 02:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AB26E43C;
	Thu, 17 Oct 2019 00:50:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690063.outbound.protection.outlook.com [40.107.69.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC8B6E43C
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 00:50:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkoEAoyK6J9/GlRz1y7PagcCUyiv2rSj3BrlCwx2QynvfPO3sGRsi8miHtTTXR7RYfa43UhL4ZORZJsdfG4jHUkNBeD0WvlSEa71FltJfJhDl3Ds5QljrkRg7NFtVPl4cTJAWLjPmmtruLF7w/BxnErPyWT2JuW7xRl5j1OqgTIp6BXNqYnDk6THOmdXcFql86lfkIY/UPQCzzVm6UIqkUMko//8HuZj11BhW9v2p+d/ZjeUX4IBbPzTAzESWj72tJEiwzcPLg7RWF5WxKUxubiB/owrLf2vKBXXUAV89mJjA1OjaElbqiyFYXk2TF7FKVY0dFwd9kDM1FSbr18Fgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3kPsGUwZSwekNsdlSu3hibHB7oqPtBJM4nPxfK8hWI=;
 b=G8sc6VFltcmI6BeL9K+hT0808oO0DUQ7qUeX4aVvETFHyE9PViihq1rMWyK3GIImbEcAK16M46VBKwyfMTxqhuiWUqvI1/iZIKx3jwyinDQKo7vjKdSanR7jYtJpuEtkwrDG1RCO+RIcS4VZdG2Chopk+KI9a2zWkS1SeoCUQ6a2ZfGB7REcaSeFUyB7cNP7w5VT+gNYCRn1aW8sMopQwL05CkEQw7XiP/jmV7Pw/zxlMI9qEbc5dDddqsyybBSOf0+UHWSZiFZ4+6gKSwI8F/Ebj6pUo7KRIrEXt9GwAaAEt7p5cJ4MhXdTipTQESHnuPF/fzO29snZmFq/0vl1pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB4231.namprd12.prod.outlook.com (20.180.17.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Thu, 17 Oct 2019 00:50:04 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994%3]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 00:50:04 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: disable c-states on xgmi perfmons
Thread-Topic: [PATCH] drm/amdgpu: disable c-states on xgmi perfmons
Thread-Index: AQHVhISs0+WbYrMUA0mDJHHtV//DAqdeAH+g
Date: Thu, 17 Oct 2019 00:50:04 +0000
Message-ID: <CH2PR12MB38317C33470907FA76768B47856D0@CH2PR12MB3831.namprd12.prod.outlook.com>
References: <20191017004852.6230-1-jonathan.kim@amd.com>
In-Reply-To: <20191017004852.6230-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:79f:f665:1c06:4309:efdb:728b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fe761db-a4da-4187-e478-08d7529bf330
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB4231:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4231E5422F12802DC9FF3963856D0@CH2PR12MB4231.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(199004)(189003)(13464003)(2351001)(14454004)(52536014)(14444005)(66446008)(74316002)(86362001)(186003)(229853002)(11346002)(446003)(5660300002)(46003)(2906002)(6246003)(102836004)(76116006)(5640700003)(6116002)(99286004)(71190400001)(71200400001)(7696005)(66556008)(76176011)(478600001)(64756008)(256004)(66476007)(53546011)(33656002)(6436002)(4326008)(9686003)(6916009)(55016002)(66946007)(25786009)(316002)(6506007)(8676002)(476003)(486006)(81156014)(305945005)(81166006)(7736002)(54906003)(8936002)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4231;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0aKHdXQqDItTjtzu/L/lUcWFAG1RmYhNfLJVpTRPIRpMLK1tOlbCxFYp6j2imC5YBWMJhYh5Tfi5JcdZYEKdHdqNNweKRo4h6H/sEFBRDXD8+tAOCeCexXJJBUbYRXnj0sZNgjgGr/tKSZYZKIVMNddgB5jy3sFTw6OXGxgDEKfU3a8yyH4t7MedfrelZ+jTaKAdtBXGzEJbxw9igzYLIw541HQI8A8u+M+1nMSNwb4D2S/LoTStGMu0w7cx3Fd04JephJio7wET44kQyQh3QWDiKY2Iqw6YEPcYkiKCkI2OPBfz+bA5xwQyAk8V0jFkrWlMzpELaJLvswRdqW26Lg02a1GtuMgv33qCWTFdzRd+Vf0+gCFwigJ+t3/EowYuPpIzTjfHt2f34+oriTR8eN1R6KhP0jsl1o0p4PNKyHs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe761db-a4da-4187-e478-08d7529bf330
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 00:50:04.8211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TYe6OAWx8fE7/aDO3JrnLWbp10HAt7j5D7iQODpAWaxl0CIJBp/MUsguqRqNsX7e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4231
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3kPsGUwZSwekNsdlSu3hibHB7oqPtBJM4nPxfK8hWI=;
 b=gwu5UZIpSkObd0D201OK0Bxsq8TycDLZlpfdp/fsjaLstEZFkdaihFdTks8Oz4qnfQvCcKh1hgs2gzg8/yx0J9IQSculvwstWo5jaas1vFS+ba1cCVYoHNtPptP4arrQ/gG1ooylU7WsRBIeJAh6k4iuQjkdalrf8Zi0ycW68BA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

KyBGZWxpeAoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogS2ltLCBKb25hdGhhbiA8
Sm9uYXRoYW4uS2ltQGFtZC5jb20+IApTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMTYsIDIwMTkg
ODo0OSBQTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IEZlbGl4LktldWhs
aW5nQGFtZC5jb207IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsgS2ltLCBKb25hdGhh
biA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+OyBLaW0sIEpvbmF0aGFuIDxKb25hdGhhbi5LaW1AYW1k
LmNvbT4KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBkaXNhYmxlIGMtc3RhdGVzIG9uIHhn
bWkgcGVyZm1vbnMKCnJlYWQgb3Igd3JpdGVzIHRvIGRmIHJlZ2lzdGVycyB3aGVuIGdwdSBkZiBp
cyBpbiBjLXN0YXRlcyB3aWxsIHJlc3VsdCBpbiBoYW5nLiAgZGYgYy1zdGF0ZXMgc2hvdWxkIGJl
IGRpc2FibGVkIHByaW9yIHRvIHJlYWQgb3Igd3JpdGVzIHRoZW4gcmUtZW5hYmxlZCBhZnRlciBy
ZWFkIG9yIHdyaXRlcy4KCkNoYW5nZS1JZDogSTZkNWE4M2U0ZmUxM2UyOWM3M2RmYjAzYTk0ZmU3
YzYxMWU4NjdmZWMKU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gS2ltIDxKb25hdGhhbi5LaW1AYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMgfCAyMSArKysr
KysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNf
Ni5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jCmluZGV4IDE2ZmJkMmJj
OGFkMS4uOWE1ODQxNjY2MmUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9kZl92M182LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jCkBA
IC0xMDIsNiArMTAyLDkgQEAgc3RhdGljIHVpbnQ2NF90IGRmX3YzXzZfZ2V0X2ZpY2Eoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJYWRkcmVzcyA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9w
Y2llX2luZGV4X29mZnNldChhZGV2KTsKIAlkYXRhID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3Bj
aWVfZGF0YV9vZmZzZXQoYWRldik7CiAKKwlpZiAoc211X3NldF9kZl9jc3RhdGUoJmFkZXYtPnNt
dSwgMCkpCisJCXJldHVybiAweEZGRkZGRkZGRkZGRkZGRkY7CisKIAlzcGluX2xvY2tfaXJxc2F2
ZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxhZ3MpOwogCVdSRUczMihhZGRyZXNzLCBzbW5ERl9Q
SUVfQU9OX0ZhYnJpY0luZGlyZWN0Q29uZmlnQWNjZXNzQWRkcmVzczMpOwogCVdSRUczMihkYXRh
LCBmaWNhYV92YWwpOwpAQCAtMTE0LDYgKzExNyw4IEBAIHN0YXRpYyB1aW50NjRfdCBkZl92M182
X2dldF9maWNhKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCiAJc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxhZ3MpOwogCisJc211X3NldF9kZl9jc3Rh
dGUoJmFkZXYtPnNtdSwgMSk7CisKIAlyZXR1cm4gKCgoZmljYWRoX3ZhbCAmIDB4RkZGRkZGRkZG
RkZGRkZGRikgPDwgMzIpIHwgZmljYWRsX3ZhbCk7ICB9CiAKQEAgLTEyNSw2ICsxMzAsOSBAQCBz
dGF0aWMgdm9pZCBkZl92M182X3NldF9maWNhKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1
aW50MzJfdCBmaWNhYV92YWwsCiAJYWRkcmVzcyA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2ll
X2luZGV4X29mZnNldChhZGV2KTsKIAlkYXRhID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVf
ZGF0YV9vZmZzZXQoYWRldik7CiAKKwlpZiAoc211X3NldF9kZl9jc3RhdGUoJmFkZXYtPnNtdSwg
MCkpCisJCXJldHVybjsKKwogCXNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT5wY2llX2lkeF9sb2Nr
LCBmbGFncyk7CiAJV1JFRzMyKGFkZHJlc3MsIHNtbkRGX1BJRV9BT05fRmFicmljSW5kaXJlY3RD
b25maWdBY2Nlc3NBZGRyZXNzMyk7CiAJV1JFRzMyKGRhdGEsIGZpY2FhX3ZhbCk7CkBAIC0xMzQs
OCArMTQyLDkgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl9zZXRfZmljYShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgdWludDMyX3QgZmljYWFfdmFsLAogCiAJV1JFRzMyKGFkZHJlc3MsIHNtbkRG
X1BJRV9BT05fRmFicmljSW5kaXJlY3RDb25maWdBY2Nlc3NEYXRhSGkzKTsKIAlXUkVHMzIoZGF0
YSwgZmljYWRoX3ZhbCk7Ci0KIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5wY2llX2lk
eF9sb2NrLCBmbGFncyk7CisKKwlzbXVfc2V0X2RmX2NzdGF0ZSgmYWRldi0+c211LCAxKTsKIH0K
IAogLyoKQEAgLTE1MywxMiArMTYyLDE3IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfcGVyZm1vbl9y
cmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWFkZHJlc3MgPSBhZGV2LT5uYmlvLmZ1
bmNzLT5nZXRfcGNpZV9pbmRleF9vZmZzZXQoYWRldik7CiAJZGF0YSA9IGFkZXYtPm5iaW8uZnVu
Y3MtPmdldF9wY2llX2RhdGFfb2Zmc2V0KGFkZXYpOwogCisJaWYgKHNtdV9zZXRfZGZfY3N0YXRl
KCZhZGV2LT5zbXUsIDApKQorCQlyZXR1cm47CisKIAlzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+
cGNpZV9pZHhfbG9jaywgZmxhZ3MpOwogCVdSRUczMihhZGRyZXNzLCBsb19hZGRyKTsKIAkqbG9f
dmFsID0gUlJFRzMyKGRhdGEpOwogCVdSRUczMihhZGRyZXNzLCBoaV9hZGRyKTsKIAkqaGlfdmFs
ID0gUlJFRzMyKGRhdGEpOwogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnBjaWVfaWR4
X2xvY2ssIGZsYWdzKTsKKworCXNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2LT5zbXUsIDEpOwogfQog
CiAvKgpAQCAtMTc1LDEyICsxODksMTcgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl9wZXJmbW9uX3dy
ZWcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IGxvX2FkZHIsCiAJYWRkcmVz
cyA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2luZGV4X29mZnNldChhZGV2KTsKIAlkYXRh
ID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfZGF0YV9vZmZzZXQoYWRldik7CiAKKwlpZiAo
c211X3NldF9kZl9jc3RhdGUoJmFkZXYtPnNtdSwgMCkpCisJCXJldHVybjsKKwogCXNwaW5fbG9j
a19pcnFzYXZlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7CiAJV1JFRzMyKGFkZHJlc3Ms
IGxvX2FkZHIpOwogCVdSRUczMihkYXRhLCBsb192YWwpOwogCVdSRUczMihhZGRyZXNzLCBoaV9h
ZGRyKTsKIAlXUkVHMzIoZGF0YSwgaGlfdmFsKTsKIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZh
ZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7CisKKwlzbXVfc2V0X2RmX2NzdGF0ZSgmYWRldi0+
c211LCAxKTsKIH0KIAogLyogZ2V0IHRoZSBudW1iZXIgb2YgZGYgY291bnRlcnMgYXZhaWxhYmxl
ICovCi0tCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
