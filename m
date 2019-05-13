Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19311BBAE
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2019 19:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CB76E7C4;
	Mon, 13 May 2019 17:19:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760078.outbound.protection.outlook.com [40.107.76.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3955B6E7C4
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 17:19:54 +0000 (UTC)
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB1931.namprd12.prod.outlook.com (10.175.86.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Mon, 13 May 2019 17:19:52 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::d8a6:de7a:d515:a14]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::d8a6:de7a:d515:a14%2]) with mapi id 15.20.1878.022; Mon, 13 May 2019
 17:19:52 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: move the VCN DPG mode read and write to VCN
Thread-Topic: [PATCH 1/2] drm/amdgpu: move the VCN DPG mode read and write to
 VCN
Thread-Index: AQHVCbATbxLoDVIxS0iEB9zj5Js2NQ==
Date: Mon, 13 May 2019 17:19:52 +0000
Message-ID: <20190513171745.7890-1-leo.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTBPR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::36) To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23a76a91-ea5c-4645-d574-08d6d7c735af
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1931; 
x-ms-traffictypediagnostic: DM5PR12MB1931:
x-microsoft-antispam-prvs: <DM5PR12MB193105857CA058F416AB42DDE50F0@DM5PR12MB1931.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:390;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(366004)(39860400002)(376002)(396003)(189003)(199004)(305945005)(2351001)(5660300002)(4326008)(7736002)(36756003)(102836004)(6506007)(71190400001)(386003)(26005)(256004)(71200400001)(2906002)(99286004)(66066001)(6512007)(186003)(486006)(2501003)(6916009)(53936002)(2616005)(3846002)(476003)(8676002)(81156014)(81166006)(6116002)(25786009)(50226002)(8936002)(316002)(6436002)(478600001)(1076003)(52116002)(5640700003)(6486002)(73956011)(66946007)(64756008)(66476007)(14454004)(66556008)(86362001)(66446008)(72206003)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1931;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hgR18sKaG6TJZpJsZJsRnhwwfhaRTWYLMClc0AUS9Ac4Ns5BMCnzneETXsqokhVX0osckCxtQ4UgRmFZGR52xJfEeQyZUTzsvU4zg/RMIWqWDEuE2VHf3jZEOMrY1V0UKZHEpwPvV7eEWeXqmeZb9hYTiOn7ETuppZSLEaFDb8iWyxb7UC1ufIGdEb/eK/GEQM16stDMRdoGQdxQpiFB59P9FyKfSldsJm+PbJgpUtJxa5ExY+dekRIUWp3aasKnPolVoQWyA74+DsLkFP78HDYxumQN+eC/zLknOH2mCNUS3SI/0I9P3fNokw+f05znXUDrAQr3kJGQP8KLPSHTpDsa8D+vwivzy85cdqGEH4aQIwWDxKkvgdkzFvqevbfp5vyjg6c/RbqhpYUW7RdTi/kWAclJXXv2/enYp7thNps=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a76a91-ea5c-4645-d574-08d6d7c735af
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 17:19:52.0962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1931
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRjV4ARYqZ//OrKXQLUaI0v+sqtpqj2DojYs2BRwG/4=;
 b=CcKrQzzHz/3Yx1clbwsb9TYKLSgVyUcRfq5HM4qSJGiHQG7MtrhuWYtMQ1OH4UVYwD7u59xxXyzMgpmImB6yQaM94GLWTyhRgbuqmE5DEtxUng0Ub0QRk26cUVaQtrgzeKGobYMtwAUkMGvrs4k+QoenrGeGKK/S3DbjmwPvr7o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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
Cc: "Liu, Leo" <Leo.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2luY2UgdGhpcyBpcyBWQ04gc3BlY2lmaWMgYW5kIG9ubHkgdXNlZCBieSBWQ04NCg0KU2lnbmVk
LW9mZi1ieTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oICAgfCAyMCArKysrKysrKysrKysrKysrKysrKw0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1X2NvbW1vbi5oIHwgMjEgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQogMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
Y24uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uaA0KaW5kZXggYTBh
ZDE5YWY5MDgwLi5kMjlhNWM5NTQ1YmQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdmNuLmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92Y24uaA0KQEAgLTQ1LDYgKzQ1LDI2IEBADQogI2RlZmluZSBWQ05fRU5DX0NNRF9SRUdf
V1JJVEUJCTB4MDAwMDAwMGINCiAjZGVmaW5lIFZDTl9FTkNfQ01EX1JFR19XQUlUCQkweDAwMDAw
MDBjDQogDQorI2RlZmluZSBSUkVHMzJfU09DMTVfRFBHX01PREUoaXAsIGluc3QsIHJlZywgbWFz
aywgc3JhbV9zZWwpIAkJCQkJXA0KKwkJKHsgV1JFRzMyX1NPQzE1KGlwLCBpbnN0LCBtbVVWRF9E
UEdfTE1BX01BU0ssIG1hc2spOyAJCQkJXA0KKwkJCVdSRUczMl9TT0MxNShpcCwgaW5zdCwgbW1V
VkRfRFBHX0xNQV9DVEwsIAkJCQlcDQorCQkJCVVWRF9EUEdfTE1BX0NUTF9fTUFTS19FTl9NQVNL
IHwgCQkJCVwNCisJCQkJKChhZGV2LT5yZWdfb2Zmc2V0W2lwIyNfSFdJUF1baW5zdF1bcmVnIyNf
QkFTRV9JRFhdICsgcmVnKSAJXA0KKwkJCQk8PCBVVkRfRFBHX0xNQV9DVExfX1JFQURfV1JJVEVf
QUREUl9fU0hJRlQpIHwgCQkJXA0KKwkJCQkoc3JhbV9zZWwgPDwgVVZEX0RQR19MTUFfQ1RMX19T
UkFNX1NFTF9fU0hJRlQpKTsgCQlcDQorCQkJUlJFRzMyX1NPQzE1KGlwLCBpbnN0LCBtbVVWRF9E
UEdfTE1BX0RBVEEpOyB9KQ0KKw0KKyNkZWZpbmUgV1JFRzMyX1NPQzE1X0RQR19NT0RFKGlwLCBp
bnN0LCByZWcsIHZhbHVlLCBtYXNrLCBzcmFtX3NlbCkgCQkJXA0KKwlkbyB7IAkJCQkJCQkJCQlc
DQorCQlXUkVHMzJfU09DMTUoaXAsIGluc3QsIG1tVVZEX0RQR19MTUFfREFUQSwgdmFsdWUpOyAJ
CQlcDQorCQlXUkVHMzJfU09DMTUoaXAsIGluc3QsIG1tVVZEX0RQR19MTUFfTUFTSywgbWFzayk7
IAkJCVwNCisJCVdSRUczMl9TT0MxNShpcCwgaW5zdCwgbW1VVkRfRFBHX0xNQV9DVEwsIAkJCQlc
DQorCQkJVVZEX0RQR19MTUFfQ1RMX19SRUFEX1dSSVRFX01BU0sgfCAJCQkJXA0KKwkJCSgoYWRl
di0+cmVnX29mZnNldFtpcCMjX0hXSVBdW2luc3RdW3JlZyMjX0JBU0VfSURYXSArIHJlZykgCVwN
CisJCQk8PCBVVkRfRFBHX0xNQV9DVExfX1JFQURfV1JJVEVfQUREUl9fU0hJRlQpIHwgCQkJXA0K
KwkJCShzcmFtX3NlbCA8PCBVVkRfRFBHX0xNQV9DVExfX1NSQU1fU0VMX19TSElGVCkpOyAJCVwN
CisJfSB3aGlsZSAoMCkNCisNCiBlbnVtIGVuZ2luZV9zdGF0dXNfY29uc3RhbnRzIHsNCiAJVVZE
X1BHRlNNX1NUQVRVU19fVVZETV9VVkRVX1BXUl9PTiA9IDB4MkFBQUEwLA0KIAlVVkRfUEdGU01f
Q09ORklHX19VVkRNX1VWRFVfUFdSX09OID0gMHgwMDAwMDAwMiwNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNV9jb21tb24uaCBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NvYzE1X2NvbW1vbi5oDQppbmRleCBjNjM0NjA2ZTY0YmQuLjQ3Zjc0ZGFiMzY1
ZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1X2NvbW1vbi5o
DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNV9jb21tb24uaA0KQEAgLTY5
LDI3ICs2OSw2IEBADQogCQl9CQkJCQkJXA0KIAl9IHdoaWxlICgwKQ0KIA0KLSNkZWZpbmUgUlJF
RzMyX1NPQzE1X0RQR19NT0RFKGlwLCBpbnN0LCByZWcsIG1hc2ssIHNyYW1fc2VsKSAJXA0KLQkJ
KHsgV1JFRzMyX1NPQzE1KGlwLCBpbnN0LCBtbVVWRF9EUEdfTE1BX01BU0ssIG1hc2spOyBcDQot
CQkJV1JFRzMyX1NPQzE1KGlwLCBpbnN0LCBtbVVWRF9EUEdfTE1BX0NUTCwJXA0KLQkJCQlVVkRf
RFBHX0xNQV9DVExfX01BU0tfRU5fTUFTSyB8CQkJCVwNCi0JCQkJKChhZGV2LT5yZWdfb2Zmc2V0
W2lwIyNfSFdJUF1baW5zdF1bcmVnIyNfQkFTRV9JRFhdICsgcmVnKSBcDQotCQkJCTw8IFVWRF9E
UEdfTE1BX0NUTF9fUkVBRF9XUklURV9BRERSX19TSElGVCkgfCBcDQotCQkJCShzcmFtX3NlbCA8
PCBVVkRfRFBHX0xNQV9DVExfX1NSQU1fU0VMX19TSElGVCkpOwlcDQotCQkJUlJFRzMyX1NPQzE1
KGlwLCBpbnN0LCBtbVVWRF9EUEdfTE1BX0RBVEEpOyB9KQ0KLQ0KLSNkZWZpbmUgV1JFRzMyX1NP
QzE1X0RQR19NT0RFKGlwLCBpbnN0LCByZWcsIHZhbHVlLCBtYXNrLCBzcmFtX3NlbCkJXA0KLQlk
byB7CQkJCQkJCVwNCi0JCVdSRUczMl9TT0MxNShpcCwgaW5zdCwgbW1VVkRfRFBHX0xNQV9EQVRB
LCB2YWx1ZSk7CVwNCi0JCVdSRUczMl9TT0MxNShpcCwgaW5zdCwgbW1VVkRfRFBHX0xNQV9NQVNL
LCBtYXNrKTsJCVwNCi0JCVdSRUczMl9TT0MxNShpcCwgaW5zdCwgbW1VVkRfRFBHX0xNQV9DVEws
CVwNCi0JCQlVVkRfRFBHX0xNQV9DVExfX1JFQURfV1JJVEVfTUFTSyB8CVwNCi0JCQkoKGFkZXYt
PnJlZ19vZmZzZXRbaXAjI19IV0lQXVtpbnN0XVtyZWcjI19CQVNFX0lEWF0gKyByZWcpIFwNCi0J
CQk8PCBVVkRfRFBHX0xNQV9DVExfX1JFQURfV1JJVEVfQUREUl9fU0hJRlQpIHwJXA0KLQkJCShz
cmFtX3NlbCA8PCBVVkRfRFBHX0xNQV9DVExfX1NSQU1fU0VMX19TSElGVCkpOyBcDQotCX0gd2hp
bGUgKDApDQotDQotDQogI2RlZmluZSBXUkVHMzJfUkxDKHJlZywgdmFsdWUpIFwNCiAJZG8gewkJ
CQkJCQlcDQogCQlpZiAoYW1kZ3B1X3ZpcnRfc3VwcG9ydF9ybGNfcHJnX3JlZyhhZGV2KSkgeyAg
ICBcDQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
