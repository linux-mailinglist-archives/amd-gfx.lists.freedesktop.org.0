Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ED25D6BB
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 21:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7016A6E039;
	Tue,  2 Jul 2019 19:16:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680048.outbound.protection.outlook.com [40.107.68.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC74F6E036
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 19:16:47 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4026.namprd12.prod.outlook.com (10.255.175.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Tue, 2 Jul 2019 19:16:45 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 19:16:45 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: Fix tracking of invalid userptrs
Thread-Topic: [PATCH 2/2] drm/amdgpu: Fix tracking of invalid userptrs
Thread-Index: AQHVMQqwyGlGAl1GxUqMTdOFBIbyhQ==
Date: Tue, 2 Jul 2019 19:16:45 +0000
Message-ID: <20190702191622.3176-2-Felix.Kuehling@amd.com>
References: <20190702191622.3176-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190702191622.3176-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37073ccb-4bd0-4354-39eb-08d6ff21d285
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB4026; 
x-ms-traffictypediagnostic: DM6PR12MB4026:
x-microsoft-antispam-prvs: <DM6PR12MB40264AE9C564FB068F347CA792F80@DM6PR12MB4026.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(199004)(189003)(66446008)(2351001)(4326008)(102836004)(66556008)(86362001)(66476007)(5660300002)(26005)(81156014)(3846002)(11346002)(50226002)(305945005)(5640700003)(8676002)(256004)(4744005)(6506007)(71190400001)(73956011)(2616005)(76176011)(486006)(81166006)(8936002)(7736002)(68736007)(1076003)(386003)(2906002)(14444005)(66946007)(71200400001)(6116002)(476003)(446003)(64756008)(6512007)(99286004)(316002)(14454004)(36756003)(25786009)(6436002)(66066001)(72206003)(6486002)(186003)(478600001)(2501003)(53936002)(6916009)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4026;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VNBX7Yln3o7CbEZMlwF4Io9WORi+B/ZDcH0OFZqDdU4k+UPle4hLKAkpeeYh1jqauy8DOK22x7MEDQTJ6IxzG4Lcu6mvc8SQeT2ce6FsoEHPjhYZtXj8rQDJXM4XpXGCBS9JjU9ooRl/f761QH2sPe3YwW+Bt9/uhyHdngHaDMkxV+qd/aVbC88y7nVeayhNKLoVSzUxB0Tta/ve9hsHm3YabhIUR3z1rGiGLkECzHgjlzHDpQvB8Nql+UgqW5uMRtwmuSVzgs8U4YWdDs2/FsBkGZEokKe04cufm1Vl6lcZqis8QeFxQZsTHcRY6LnWj0utAtphTNAQf7E8EQawjdJzeMUk3TyaUOAHp/dx8X//HkqMQEn5FOIgr5lbJPek7RX4lxtCeYa8xoqiofJPc+cgMm4wNn+pcTGb4d71iiw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37073ccb-4bd0-4354-39eb-08d6ff21d285
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 19:16:45.3782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4026
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UR5HX1+RzulizJ9Dz/+Gau3Y99IMZHKchW6Nyp2HFXU=;
 b=gMErK/QAIRZxFwkMoTOLOqUbg+OHecd63ERdEHsTypUAJFtvOwNkWb66W5EqBuBMtjTXjvS5eUU5TdKpreHV84+zwrJQQMYXDKAzBNZGyZylk9jbal3LIdqgVwbmVDHSi2HcqZy1QOp5IorEzDLnyqht+olUVIi7QsP7NWReCNk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVzdG9yZSB0aGUgY29kZSB0aGF0IHJlc2V0cyBtZW0tPmludmFsaWQuIE90aGV3aXNlIHNvIG1h
cHBpbmcKdXNlcnB0cnMgYWZ0ZXIgdGhleSBnb3QgYW4gTU1VIG5vdGlmaWVycyB3b3VsZCBhbHdh
eXMgYmUgc2tpcHBlZC4KClRoaXMgYWxzbyBhdm9pZHMgdW5uZWNlc3NhcmlseSBjYWxsaW5nIGdl
dF91c2VyX3BhZ2VzIG9uIEJPcyB0aGF0CmhhdmUgbm90IGJlZW4gaW52YWxpZGF0ZWQgc2luY2Ug
dGhlIGxhc3QgdHJ5LgoKU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhs
aW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMg
fCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwppbmRleCA4NjdhZjY2
YzIxMjYuLjU4Y2VjZmU1N2Y4YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwpAQCAtMTczOSw2ICsxNzM5LDEyIEBAIHN0YXRpYyBpbnQg
dXBkYXRlX2ludmFsaWRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1ka2ZkX3Byb2Nlc3NfaW5mbyAqcHJv
Y2Vzc19pbmZvLAogCQl9CiAKIAkJYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlc19kb25lKGJv
LT50Ym8udHRtKTsKKworCQkvKiBNYXJrIHRoZSBCTyBhcyB2YWxpZCB1bmxlc3MgaXQgd2FzIGlu
dmFsaWRhdGVkCisJCSAqIGFnYWluIGNvbmN1cnJlbnRseS4KKwkJICovCisJCWlmIChhdG9taWNf
Y21weGNoZygmbWVtLT5pbnZhbGlkLCBpbnZhbGlkLCAwKSAhPSBpbnZhbGlkKQorCQkJcmV0dXJu
IC1FQUdBSU47CiAJfQogCiAJcmV0dXJuIDA7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
