Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 182A8B73C1
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908836F877;
	Thu, 19 Sep 2019 07:12:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700051.outbound.protection.outlook.com [40.107.70.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A9F6F877
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:12:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJ9mbqIgJHWKKwP6f/Esx2yeuRxQvZByLAO7fT8FtKI76egvFcqJT6OhMUsxeWX0JS4U1iZUTUBJWnf4N1/PEcVeZRdueyS4FqoKGpOhYD7xyVfXK3VA+m8SJXntr7+EEY1IxnyN+Cy6bUE53DVPY53KeC8wrL9nG093UWrbyBivt/PMc3uRqvaMdaByEjMjhqJuj6LjuUTBRArKJorzw1uYpbd73RDlSsQrRJsvA/WL4IZOfrt8GCzG5gr8nDEa2LNOm/Lc5LQOIYoOdtUjQ6kgfuGZB75N3vduRXJUkTNALtV0/+cTwETCsajav5nKVbf7Asf+1FItRGaLMUzYuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6zkAOen62PvVCWstrduVv0K7eAg1p9TpYmmhkFVlS4=;
 b=CZ/T0pSJl3QvNxNfXFcgBZtM/6aNrZIUts4BFEHVzGHDeAQQrb/L7U7ZzC8NPburl06fvhuhAITgefmPU35lhNshFOiSuw4VqESeocOTfzg42kgnf/upXzT8Tjv3qd+WNhPgkyubLmRnbI6f2jMATyMmbx+nkJLTtvXd6CdEmL2kcdylZcJJvHb2bcBnRs4TPr6WM2+obhfKiq5KsQGPDe6zt7F6ATYhlLBrNckU9f3y0doYKnX6H86S2ZA7DfHx31wsrUmi5ryEcHdIeAndseuPCS1ob2UMfQtveKb+kneOKfKYwVuciV4OJy0IiHn7CN1kPWCprUdXy02uhBDiKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 07:12:27 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:12:27 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 00/21] RAS code refinements
Thread-Topic: [PATCH 00/21] RAS code refinements
Thread-Index: AQHVbrmYtE32o8te3ku+Z3JeoPDn4g==
Date: Thu, 19 Sep 2019 07:12:27 +0000
Message-ID: <20190919071115.16552-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0092.apcprd03.prod.outlook.com
 (2603:1096:203:72::32) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb56f977-6261-4531-14a7-08d73cd0ba6f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB28941228DC3018FA4D38BECFB0890@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(186003)(6506007)(102836004)(6512007)(316002)(8676002)(81156014)(64756008)(2501003)(52116002)(476003)(2616005)(66446008)(86362001)(8936002)(5660300002)(66946007)(66476007)(81166006)(66556008)(50226002)(3846002)(2906002)(486006)(99286004)(110136005)(6116002)(25786009)(7736002)(256004)(1076003)(66066001)(26005)(14454004)(386003)(6436002)(6486002)(14444005)(4326008)(478600001)(71190400001)(71200400001)(6636002)(305945005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uemVL1f4XsaDzuuLg10bXayjFun9GBvK5V5q2qxG5M1CrUQNyPOksL3aiV+cv21ojGw5d0Vd/5Z9D6Woz/laCSL8HV0rAqFC4Ab1//HeIkrPQpK8zkCsIu+XNlkLrcVLuKx59vjru1Gaa9gDlHubC6vw87FzK4l3iSz2ev9/SDegUQTOWo7M+ac0uF6zSnuCnniNzFjhA/PyBHMI+KHiWc/a9wA2www53RIz77/yegRBRHvq5v3MxpA4NoWYqGbuIiQTMHG7pyQ8Ktj44nVDq1j8yJ2PvVMCWnjmn1AzWnMuYFlyWsoiqUL8iBTI8LreuY0h8M4b+wSm9zhYBc+DTeNJ0+wVurkLX8MUEKxf3OZeh1yHCaNiUDV2zPFn3AGtCduBLnonkL1v/2feoYscYcEhMcz8+8Y/vIfL0+YHQNo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb56f977-6261-4531-14a7-08d73cd0ba6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:12:27.6959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RXebWddw6igezKFVEPg3a9lwQARsAnPVm5B0dWXvMU4X/KtcaPlH6vbs4MYcrhYZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6zkAOen62PvVCWstrduVv0K7eAg1p9TpYmmhkFVlS4=;
 b=vMrOt9XSc7cHsvvtg5+UEnkdq/CoyMJsZMiDNNFYc/zzXMkRedyPXsCk/L/8o2EGDe4nT5dq5BtcrCetWJ9PDdI5h7LHxSRSYOGf9DHMwvl3HDU7fznSwpTgcBw01sN+wR3Torjq4rj5l2aUsqOOWKsSBwP/KGzGEhF6NEg8t5c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

c29tZSByZWZpbmVtZW50cyBmb3IgUkFTLCBubyBmdW5jdGlvbmFsIGNoYW5nZToKCjEuIG1ha2Ug
bW9yZSByYXMgY29kZSBjYW4gYmUgcmV1c2FibGUgYW1vbmcgZGlmZmVyZW50IGdlbmVyYXRpb25z
IG9mIHJhcwpibG9jazsKMi4gbWFrZSBzb21lIHJhcyBjb2RlIHNpbXBsZXI7CgpUYW8gWmhvdSAo
MjEpOgogIGRybS9hbWRncHU6IHVwZGF0ZSBwYXJhbWV0ZXIgb2YgcmFzX2loX2NiCiAgZHJtL2Ft
ZGdwdTogbW92ZSB1bWMgcmFzIGlycSBmdW5jdGlvbnMgdG8gdW1jIGJsb2NrCiAgZHJtL2FtZGdw
dTogbW92ZSBnZnggZWNjIGZ1bmN0aW9ucyB0byBnZW5lcmljIGdmeCBmaWxlCiAgZHJtL2FtZGdw
dTogbW92ZSBzZG1hIGVjYyBmdW5jdGlvbnMgdG8gZ2VuZXJpYyBzZG1hIGZpbGUKICBkcm0vYW1k
Z3B1OiByZWZpbmUgc2RtYTQgcmFzX2RhdGFfY2IKICBkcm0vYW1kZ3B1OiBtb3ZlIHVtY19yYXNf
aWYgZnJvbSBnbWMgdG8gdW1jIGJsb2NrCiAgZHJtL2FtZGdwdTogYWRkIGNvbW1vbiBtbWh1YiBt
ZW1iZXIgZm9yIGFkZXYKICBkcm0vYW1kZ3B1OiByZXBsYWNlIG1taHViX2Z1bmNzIHdpdGggbW1o
dWIuZnVuY3MKICBkcm0vYW1kZ3B1OiBtb3ZlIG1taHViX3Jhc19pZiBmcm9tIGdtYyB0byBtbWh1
YiBibG9jawogIGRybS9hbWRncHU6IGFkZCBjb21tb24gZ21jX3Jhc19maW5pIGZ1bmN0aW9uCiAg
ZHJtL2FtZGdwdTogYWRkIGNvbW1vbiBnZnhfcmFzX2ZpbmkgZnVuY3Rpb24KICBkcm0vYW1kZ3B1
OiBhZGQgY29tbW9uIHNkbWFfcmFzX2ZpbmkgZnVuY3Rpb24KICBkcm0vYW1kZ3B1OiByZW1vdmUg
aWhfaW5mbyBwYXJhbWV0ZXIgb2YgdW1jX3Jhc19sYXRlX2luaXQKICBkcm0vYW1kZ3B1OiByZW1v
dmUgaWhfaW5mbyBwYXJhbWV0ZXIgb2YgZ2Z4X3Jhc19sYXRlX2luaXQKICBkcm0vYW1kZ3B1OiBz
aW1wbGlmeSB0aGUgYWNjZXNzIHRvIGVlcHJvbV9jb250cm9sIHN0cnVjdAogIGRybS9hbWRncHU6
IGFkZCByYXMgZmluaSBmb3IgbmJpbwogIGRybS9hbWRncHU6IGFkZCByYXMgZmluaSBmb3IgeGdt
aQogIGRybS9hbWRncHU6IG1vdmUgdW1jIHJhcyBmaW5pIHRvIHVtYyBibG9jawogIGRybS9hbWRn
cHU6IG1vdmUgbW1odWIgcmFzIGZpbmkgdG8gbW1odWIgYmxvY2sKICBkcm0vYW1kZ3B1OiBtb3Zl
IHhnbWkgcmFzIGZpbmkgdG8geGdtaSBibG9jawogIGRybS9hbWRncHU6IGltcGxlbWVudCBjb21t
b24gZ21jX2VjY19sYXRlX2luaXQKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aCAgICAgICB8ICAgNCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5j
ICAgfCAgNjQgKysrKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2Z4LmggICB8ICAxMCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5j
ICAgfCAgMjcgKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaCAg
IHwgICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW1odWIuYyB8ICAz
OCArKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW1odWIuaCB8ICAg
NyArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X25iaW8uYyAgfCAgMTQgKysr
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJpby5oICB8ICAgMiArLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jICAgfCAgMTAgKy0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCAgIHwgICAyICstCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfc2RtYS5jICB8ICA0NyArKysrKysrKysKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zZG1hLmggIHwgICA3ICsrCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdW1jLmMgICB8IDExNyArKysrKysrKysrKysrKysrKy0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaCAgIHwgIDEyICsrLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYyAgfCAgMTQgKysrCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5oICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgICB8ICA1OCArLS0tLS0tLS0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgICAgfCAxMTkgKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgICAgfCAgNzQgKysrKy0t
LS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgICAgICAgIHwgICAx
ICsKIDIxIGZpbGVzIGNoYW5nZWQsIDM1MyBpbnNlcnRpb25zKCspLCAyNzkgZGVsZXRpb25zKC0p
CgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
