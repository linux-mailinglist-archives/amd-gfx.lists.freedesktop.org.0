Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E40714AEF
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 15:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34263898C0;
	Mon,  6 May 2019 13:31:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790087.outbound.protection.outlook.com [40.107.79.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDD8898C0
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 13:31:11 +0000 (UTC)
Received: from MN2PR12MB3408.namprd12.prod.outlook.com (20.178.243.85) by
 MN2PR12MB3758.namprd12.prod.outlook.com (10.255.236.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Mon, 6 May 2019 13:31:09 +0000
Received: from MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::7042:de63:ed77:13b4]) by MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::7042:de63:ed77:13b4%5]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 13:31:09 +0000
From: "Huang, Trigger" <Trigger.Huang@amd.com>
To: "Huang, Trigger" <Trigger.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Use FW addr returned by PSP for VF MM
Thread-Topic: [PATCH] drm/amdgpu: Use FW addr returned by PSP for VF MM
Thread-Index: AQHVAOZ7cZh9oVEEUkeAiAfIgpGMdqZeHgHg
Date: Mon, 6 May 2019 13:31:09 +0000
Message-ID: <MN2PR12MB34084BB70C62DA72AB4A2610FE300@MN2PR12MB3408.namprd12.prod.outlook.com>
References: <1556801791-8460-1-git-send-email-Trigger.Huang@amd.com>
In-Reply-To: <1556801791-8460-1-git-send-email-Trigger.Huang@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 166a700c-6e70-44db-2944-08d6d22719b7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3758; 
x-ms-traffictypediagnostic: MN2PR12MB3758:
x-microsoft-antispam-prvs: <MN2PR12MB3758B22BFEE75EB61FC7BAAFFE300@MN2PR12MB3758.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:530;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(39860400002)(346002)(396003)(376002)(199004)(13464003)(189003)(14454004)(53546011)(186003)(305945005)(8936002)(66066001)(25786009)(99286004)(33656002)(6116002)(3846002)(68736007)(76176011)(52536014)(7696005)(74316002)(71190400001)(71200400001)(6506007)(81166006)(9686003)(486006)(72206003)(8676002)(53936002)(86362001)(55016002)(446003)(316002)(256004)(7736002)(478600001)(2906002)(476003)(26005)(11346002)(6246003)(73956011)(76116006)(229853002)(2501003)(102836004)(110136005)(64756008)(81156014)(66446008)(66556008)(66476007)(5660300002)(6436002)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3758;
 H:MN2PR12MB3408.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jg9QXurYv4L09euKt4Dp4tQ0LxPTHFp3u0lC79ih8VM6TFv+Bi77Xwf1PicToL8v6NIpddsCF1IHcVQ2AP6evHYXjsZR1Kwg8LSMu+wpKKJvrWf+i1Filh/v7wlI8RGf63eLBQYzP4vXRvPNBzXCly89L8e+5OTGHlzX8Yk/qDsfABLuIGHzOr3lBja/icQnTNUAk7cdXDqQ+U46CWpciS6AqeJ8ikYXZb+oaX560ZgdzB+dNJeOXPabgdMiHetdu8iL2KsvZYsNYgxTl1AtyQC66vzFRiiz0k2RundDwGL71deEcDJUYuvohqYzfDnVdThx5DSVrkeavmcfkqF87RVBB9K2bv9zek/7rYwIkBrtFo3TzAZHs5Z0mNVbS4qQI2CEpEd/0+4R0LMCJd1sABJeo+pC1AipKyG3VOfpgNU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166a700c-6e70-44db-2944-08d6d22719b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 13:31:09.5284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3758
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoWPCY2SlUiKz97XFeTaTO78D/5SFP29DxIOeHsYFQ8=;
 b=bjyul26WhEvOAGi0jIkemhHFwm4bsCYMaBdZYi86zwd8T8UyEmAtXpANelBMPnquF8b47cWxWaLnwac05WuafM24xvjN0ryjdMNvj7/lEujGM1ZPdy0Z2rjIQj4WePa+akpRhEltORrXYrBdF0wUdhg5RBbgs7inAKuXiGkrQbU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Trigger.Huang@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZyBhZ2Fpbi4KCgpUaGFua3MgJiBCZXN0IFdpc2hlcywKVHJpZ2dlciBIdWFuZwoKLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogVHJpZ2dlciBIdWFuZyA8VHJpZ2dlci5IdWFuZ0Bh
bWQuY29tPiAKU2VudDogVGh1cnNkYXksIE1heSAwMiwgMjAxOSA4OjU3IFBNClRvOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogSHVhbmcsIFRyaWdnZXIgPFRyaWdnZXIuSHVhbmdA
YW1kLmNvbT4KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBVc2UgRlcgYWRkciByZXR1cm5l
ZCBieSBQU1AgZm9yIFZGIE1NCgpPbmUgVmVnYTEwIFNSLUlPViBWRiwgdGhlIEZXIGFkZHJlc3Mg
cmV0dXJuZWQgYnkgUFNQIHNob3VsZCBiZSBzZXQgaW50byB0aGUgaW5pdCB0YWJsZSwgd2hpbGUg
bm90IHRoZSBvcmlnaW5hbCBCTyBtYyBhZGRyZXNzLgpvdGhlcndpc2UsIFVWRCBhbmQgVkNFIElC
IHRlc3Qgd2lsbCBmYWlsIHVuZGVyIFZlZ2ExMCBTUi1JT1YKCnJlZmVyZW5jZToKCWNvbW1pdCBi
ZmNlYTUyMDQyODcgKCJkcm0vYW1kZ3B1OmNoYW5nZSBWRUdBIGJvb3Rpbmcgd2l0aCBmaXJtd2Fy
ZSBsb2FkZWQgYnkgUFNQIikKCWNvbW1pdCBhYTU4NzNkY2E0NjMgKCJkcm0vYW1kZ3B1OiBDaGFu
Z2UgVkNFIGJvb3Rpbmcgd2l0aCBmaXJtd2FyZSBsb2FkZWQgYnkgUFNQIikKClNpZ25lZC1vZmYt
Ynk6IFRyaWdnZXIgSHVhbmcgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jIHwgMTYgKysrKysrKysrKy0tLS0tLSAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYyB8IDE3ICsrKysrKysrKysrLS0tLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92N18wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jCmluZGV4IGRjNDYxZGYuLjIxOTFkM2QgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92N18wLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYwpAQCAtNzg3LDEwICs3ODcsMTMgQEAgc3Rh
dGljIGludCB1dmRfdjdfMF9zcmlvdl9zdGFydChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAkJCQkJCQkgICAweEZGRkZGRkZGLCAweDAwMDAwMDA0KTsKIAkJCS8qIG1jIHJlc3VtZSovCiAJ
CQlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX1BTUCkgewot
CQkJCU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VUKFVWRCwgaSwg
bW1VVkRfTE1JX1ZDUFVfQ0FDSEVfNjRCSVRfQkFSX0xPVyksCi0JCQkJCQkJICAgIGxvd2VyXzMy
X2JpdHMoYWRldi0+ZmlybXdhcmUudWNvZGVbQU1ER1BVX1VDT0RFX0lEX1VWRF0ubWNfYWRkcikp
OwotCQkJCU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VUKFVWRCwg
aSwgbW1VVkRfTE1JX1ZDUFVfQ0FDSEVfNjRCSVRfQkFSX0hJR0gpLAotCQkJCQkJCSAgICB1cHBl
cl8zMl9iaXRzKGFkZXYtPmZpcm13YXJlLnVjb2RlW0FNREdQVV9VQ09ERV9JRF9VVkRdLm1jX2Fk
ZHIpKTsKKwkJCQlNTVNDSF9WMV8wX0lOU0VSVF9ESVJFQ1RfV1QoU09DMTVfUkVHX09GRlNFVChV
VkQsIGksCisJCQkJCQkJbW1VVkRfTE1JX1ZDUFVfQ0FDSEVfNjRCSVRfQkFSX0xPVyksCisJCQkJ
CQkJYWRldi0+ZmlybXdhcmUudWNvZGVbQU1ER1BVX1VDT0RFX0lEX1VWRF0udG1yX21jX2FkZHJf
bG8pOworCQkJCU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VUKFVW
RCwgaSwKKwkJCQkJCQltbVVWRF9MTUlfVkNQVV9DQUNIRV82NEJJVF9CQVJfSElHSCksCisJCQkJ
CQkJYWRldi0+ZmlybXdhcmUudWNvZGVbQU1ER1BVX1VDT0RFX0lEX1VWRF0udG1yX21jX2FkZHJf
aGkpOworCQkJCU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VUKFVW
RCwgMCwgCittbVVWRF9WQ1BVX0NBQ0hFX09GRlNFVDApLCAwKTsKIAkJCQlvZmZzZXQgPSAwOwog
CQkJfSBlbHNlIHsKIAkJCQlNTVNDSF9WMV8wX0lOU0VSVF9ESVJFQ1RfV1QoU09DMTVfUkVHX09G
RlNFVChVVkQsIGksIG1tVVZEX0xNSV9WQ1BVX0NBQ0hFXzY0QklUX0JBUl9MT1cpLApAQCAtNzk4
LDEwICs4MDEsMTEgQEAgc3RhdGljIGludCB1dmRfdjdfMF9zcmlvdl9zdGFydChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKIAkJCQlNTVNDSF9WMV8wX0lOU0VSVF9ESVJFQ1RfV1QoU09DMTVf
UkVHX09GRlNFVChVVkQsIGksIG1tVVZEX0xNSV9WQ1BVX0NBQ0hFXzY0QklUX0JBUl9ISUdIKSwK
IAkJCQkJCQkgICAgdXBwZXJfMzJfYml0cyhhZGV2LT51dmQuaW5zdFtpXS5ncHVfYWRkcikpOwog
CQkJCW9mZnNldCA9IHNpemU7CisJCQkJTU1TQ0hfVjFfMF9JTlNFUlRfRElSRUNUX1dUKFNPQzE1
X1JFR19PRkZTRVQoVVZELCAwLCBtbVVWRF9WQ1BVX0NBQ0hFX09GRlNFVDApLAorCQkJCQkJCUFN
REdQVV9VVkRfRklSTVdBUkVfT0ZGU0VUID4+IDMpOworCiAJCQl9CiAKLQkJCU1NU0NIX1YxXzBf
SU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VUKFVWRCwgaSwgbW1VVkRfVkNQVV9DQUNI
RV9PRkZTRVQwKSwKLQkJCQkJCSAgICBBTURHUFVfVVZEX0ZJUk1XQVJFX09GRlNFVCA+PiAzKTsK
IAkJCU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VUKFVWRCwgaSwg
bW1VVkRfVkNQVV9DQUNIRV9TSVpFMCksIHNpemUpOwogCiAJCQlNTVNDSF9WMV8wX0lOU0VSVF9E
SVJFQ1RfV1QoU09DMTVfUkVHX09GRlNFVChVVkQsIGksIG1tVVZEX0xNSV9WQ1BVX0NBQ0hFMV82
NEJJVF9CQVJfTE9XKSwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zj
ZV92NF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjRfMC5jCmluZGV4IGYz
ZjU5MzguLmMwZWMyNzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zj
ZV92NF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYwpAQCAt
MjQ0LDEzICsyNDQsMTggQEAgc3RhdGljIGludCB2Y2VfdjRfMF9zcmlvdl9zdGFydChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKIAkJTU1TQ0hfVjFfMF9JTlNFUlRfRElSRUNUX1dUKFNPQzE1
X1JFR19PRkZTRVQoVkNFLCAwLCBtbVZDRV9MTUlfU1dBUF9DTlRMMSksIDApOwogCQlNTVNDSF9W
MV8wX0lOU0VSVF9ESVJFQ1RfV1QoU09DMTVfUkVHX09GRlNFVChWQ0UsIDAsIG1tVkNFX0xNSV9W
TV9DVFJMKSwgMCk7CiAKKwkJb2Zmc2V0ID0gQU1ER1BVX1ZDRV9GSVJNV0FSRV9PRkZTRVQ7CiAJ
CWlmIChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQKSB7CisJ
CQl1aW50MzJfdCBsb3cgPSBhZGV2LT5maXJtd2FyZS51Y29kZVtBTURHUFVfVUNPREVfSURfVkNF
XS50bXJfbWNfYWRkcl9sbzsKKwkJCXVpbnQzMl90IGhpID0gYWRldi0+ZmlybXdhcmUudWNvZGVb
QU1ER1BVX1VDT0RFX0lEX1ZDRV0udG1yX21jX2FkZHJfaGk7CisJCQl1aW50NjRfdCB0bXJfbWNf
YWRkciA9ICh1aW50NjRfdCkoaGkpIDw8IDMyIHwgbG93OworCiAJCQlNTVNDSF9WMV8wX0lOU0VS
VF9ESVJFQ1RfV1QoU09DMTVfUkVHX09GRlNFVChWQ0UsIDAsCi0JCQkJCQltbVZDRV9MTUlfVkNQ
VV9DQUNIRV80MEJJVF9CQVIwKSwKLQkJCQkJCWFkZXYtPmZpcm13YXJlLnVjb2RlW0FNREdQVV9V
Q09ERV9JRF9WQ0VdLm1jX2FkZHIgPj4gOCk7CisJCQkJCQltbVZDRV9MTUlfVkNQVV9DQUNIRV80
MEJJVF9CQVIwKSwgdG1yX21jX2FkZHIgPj4gOCk7CiAJCQlNTVNDSF9WMV8wX0lOU0VSVF9ESVJF
Q1RfV1QoU09DMTVfUkVHX09GRlNFVChWQ0UsIDAsCiAJCQkJCQltbVZDRV9MTUlfVkNQVV9DQUNI
RV82NEJJVF9CQVIwKSwKLQkJCQkJCShhZGV2LT5maXJtd2FyZS51Y29kZVtBTURHUFVfVUNPREVf
SURfVkNFXS5tY19hZGRyID4+IDQwKSAmIDB4ZmYpOworCQkJCQkJKHRtcl9tY19hZGRyID4+IDQw
KSAmIDB4ZmYpOworCQkJTU1TQ0hfVjFfMF9JTlNFUlRfRElSRUNUX1dUKFNPQzE1X1JFR19PRkZT
RVQoVkNFLCAwLCAKK21tVkNFX1ZDUFVfQ0FDSEVfT0ZGU0VUMCksIDApOwogCQl9IGVsc2Ugewog
CQkJTU1TQ0hfVjFfMF9JTlNFUlRfRElSRUNUX1dUKFNPQzE1X1JFR19PRkZTRVQoVkNFLCAwLAog
CQkJCQkJbW1WQ0VfTE1JX1ZDUFVfQ0FDSEVfNDBCSVRfQkFSMCksIEBAIC0yNTgsNiArMjYzLDkg
QEAgc3RhdGljIGludCB2Y2VfdjRfMF9zcmlvdl9zdGFydChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIAkJCU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VUKFZD
RSwgMCwKIAkJCQkJCW1tVkNFX0xNSV9WQ1BVX0NBQ0hFXzY0QklUX0JBUjApLAogCQkJCQkJKGFk
ZXYtPnZjZS5ncHVfYWRkciA+PiA0MCkgJiAweGZmKTsKKwkJCU1NU0NIX1YxXzBfSU5TRVJUX0RJ
UkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VUKFZDRSwgMCwgbW1WQ0VfVkNQVV9DQUNIRV9PRkZTRVQw
KSwKKwkJCQkJCW9mZnNldCAmIH4weDBmMDAwMDAwKTsKKwogCQl9CiAJCU1NU0NIX1YxXzBfSU5T
RVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VUKFZDRSwgMCwKIAkJCQkJCW1tVkNFX0xNSV9W
Q1BVX0NBQ0hFXzQwQklUX0JBUjEpLCBAQCAtMjcyLDEwICsyODAsNyBAQCBzdGF0aWMgaW50IHZj
ZV92NF8wX3NyaW92X3N0YXJ0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJCQkJbW1W
Q0VfTE1JX1ZDUFVfQ0FDSEVfNjRCSVRfQkFSMiksCiAJCQkJCQkoYWRldi0+dmNlLmdwdV9hZGRy
ID4+IDQwKSAmIDB4ZmYpOwogCi0JCW9mZnNldCA9IEFNREdQVV9WQ0VfRklSTVdBUkVfT0ZGU0VU
OwogCQlzaXplID0gVkNFX1Y0XzBfRldfU0laRTsKLQkJTU1TQ0hfVjFfMF9JTlNFUlRfRElSRUNU
X1dUKFNPQzE1X1JFR19PRkZTRVQoVkNFLCAwLCBtbVZDRV9WQ1BVX0NBQ0hFX09GRlNFVDApLAot
CQkJCQlvZmZzZXQgJiB+MHgwZjAwMDAwMCk7CiAJCU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9X
VChTT0MxNV9SRUdfT0ZGU0VUKFZDRSwgMCwgbW1WQ0VfVkNQVV9DQUNIRV9TSVpFMCksIHNpemUp
OwogCiAJCW9mZnNldCA9IChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgIT0gQU1ER1BVX0ZXX0xP
QURfUFNQKSA/IG9mZnNldCArIHNpemUgOiAwOwotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
