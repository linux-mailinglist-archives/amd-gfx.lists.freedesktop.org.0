Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B088E60058
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 07:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5496E402;
	Fri,  5 Jul 2019 05:02:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700051.outbound.protection.outlook.com [40.107.70.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE806E402
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 05:02:10 +0000 (UTC)
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1948.namprd12.prod.outlook.com (10.175.88.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.15; Fri, 5 Jul 2019 05:02:08 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa%9]) with mapi id 15.20.2032.022; Fri, 5 Jul 2019
 05:02:08 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: add mode1 (psp) reset for navi asic
Thread-Topic: [PATCH] drm/amdgpu: add mode1 (psp) reset for navi asic
Thread-Index: AQHVMu5BCQKWijjzNUyrroLP+C+4mKa7d2Zw
Date: Fri, 5 Jul 2019 05:02:08 +0000
Message-ID: <DM5PR12MB141852448B0C14F9A544533EFCF50@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190705045740.28107-1-kevin1.wang@amd.com>
In-Reply-To: <20190705045740.28107-1-kevin1.wang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e522d492-96f5-4afa-3b85-08d70105ee71
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1948; 
x-ms-traffictypediagnostic: DM5PR12MB1948:
x-microsoft-antispam-prvs: <DM5PR12MB19485B15D40E13922C1AEF87FCF50@DM5PR12MB1948.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(189003)(199004)(13464003)(33656002)(229853002)(476003)(71190400001)(81156014)(81166006)(8676002)(71200400001)(8936002)(3846002)(6116002)(2501003)(14454004)(6246003)(66066001)(7736002)(53936002)(11346002)(486006)(9686003)(6436002)(55016002)(446003)(6506007)(66476007)(305945005)(256004)(14444005)(2906002)(76116006)(54906003)(110136005)(66446008)(52536014)(66556008)(316002)(64756008)(74316002)(72206003)(66946007)(53546011)(73956011)(26005)(25786009)(102836004)(99286004)(186003)(4326008)(86362001)(478600001)(5660300002)(68736007)(76176011)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1948;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Mt5fPImUisZCJfGGn4K92TDJhZe//SylrD675bMVXD9WIEbXTncpE7Yog6ETjyCRasloh8zS3l9oC49zCCN3z/hmf5VuEiJtUaZX2VpIzB1MFZ0Ia9utEHGlp0RNzrEzQ2qM7SqU3x6T/IwpQ8xQbJtTuSnearwQraBIQO14WiKS1c21QpdaxTwztbWdMwU/MnRxjF2RxThb8ywaY7AZAcdhGsEpAa4E8QM2r65Vov5p5c7481dcSP0eQ216lEd5Hlgjq0ORlfpN4RtwvvUUq0eWoZUmyVMNtQcpaKh0XXRFo8UCULYrgGaNDp+2Coq+b5DXYvqar9k/wBk8cnd15973BzbqtLLxGW8wOQhbSs0S6QsDM3t6vFlID/LtNpOnPxTcdoxpkENxSr7KUYb9/tOQX7P20q+s2TSTd6oFi8E=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e522d492-96f5-4afa-3b85-08d70105ee71
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 05:02:08.1415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1948
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0XR4jTw6ftX4dLwlmS5eqlGizpDYlT7+LDkU08T+O0=;
 b=a++aFYNqIpvyDafk0nAfovH2Oehp7mWap6KrrRk6dPSLFh1Ff8ZSeD5IIT0wU8gMzRxChBIllMj6vioM2/xD2Zo7iVHHxFOXXmn9qcU4rdJTbF1F/PgDGPG3YgzxA0GtjT1oC9Q4IH4YnxnzeJbflDAw0Gyay+I3/OS1s8V9hVU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>,
 "Kenenth.Feng@amd.com" <Kenenth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CWlmIChzbXVfYmFjb19pc19zdXBwb3J0KHNtdSkpIHsNCiAJCXJldCA9IHNtdV9iYWNvX3Jlc2V0
KHNtdSk7DQorCX0gZWxzZSB7DQorCQlyZXQgPSBudl9hc2ljX21vZGUxX3Jlc2V0KGFkZXYpOw0K
IAl9DQpXZSBkb27igJl0IG5lZWQge30gZm9yIHNpbmdsZSBzdGF0ZW1lbnRzLiBXaXRoIHRoYXQg
Zml4ZWQsIHRoZSBwYXRjaCBpcw0KDQpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2lu
Zy5aaGFuZ0BhbWQuY29tPg0KDQpSZWdhcmRzLA0KSGF3a2luZw0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogV2FuZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+
IA0KU2VudDogMjAxOeW5tDfmnIg15pelIDEyOjU4DQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCkNjOiBYaWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT47IEtlbmVudGguRmVu
Z0BhbWQuY29tOyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgV2FuZywg
S2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9h
bWRncHU6IGFkZCBtb2RlMSAocHNwKSByZXNldCBmb3IgbmF2aSBhc2ljDQoNCmFkZCBtb2RlMSAo
YnkgcHNwKSByZXNldCBmb3IgbmF2aSBhc2ljLg0KDQpDaGFuZ2UtSWQ6IElkMmU3Y2IxMWViNzAy
NjI5NmQxNDg4YzdjMzlmODk1YjEwMGYyMDZjDQpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXYW5nIDxr
ZXZpbjEud2FuZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYu
YyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2Vk
LCAzNSBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9udi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBpbmRleCBmNmYxNTJl
NmFkZTQuLjA1ZmQ0NzM2YmMwYyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L252LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMNCkBAIC0yNTYs
NiArMjU2LDM5IEBAIHN0YXRpYyB2b2lkIG52X2dwdV9wY2lfY29uZmlnX3Jlc2V0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KSAgfSAgI2VuZGlmDQogDQorc3RhdGljIGludCBudl9hc2ljX21v
ZGUxX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSB7DQorCXUzMiBpOw0KKwlpbnQg
cmV0ID0gMDsNCisNCisJYW1kZ3B1X2F0b21iaW9zX3NjcmF0Y2hfcmVnc19lbmdpbmVfaHVuZyhh
ZGV2LCB0cnVlKTsNCisNCisJZGV2X2luZm8oYWRldi0+ZGV2LCAiR1BVIG1vZGUxIHJlc2V0XG4i
KTsNCisNCisJLyogZGlzYWJsZSBCTSAqLw0KKwlwY2lfY2xlYXJfbWFzdGVyKGFkZXYtPnBkZXYp
Ow0KKw0KKwlwY2lfc2F2ZV9zdGF0ZShhZGV2LT5wZGV2KTsNCisNCisJcmV0ID0gcHNwX2dwdV9y
ZXNldChhZGV2KTsNCisJaWYgKHJldCkNCisJCWRldl9lcnIoYWRldi0+ZGV2LCAiR1BVIG1vZGUx
IHJlc2V0IGZhaWxlZFxuIik7DQorDQorCXBjaV9yZXN0b3JlX3N0YXRlKGFkZXYtPnBkZXYpOw0K
Kw0KKwkvKiB3YWl0IGZvciBhc2ljIHRvIGNvbWUgb3V0IG9mIHJlc2V0ICovDQorCWZvciAoaSA9
IDA7IGkgPCBhZGV2LT51c2VjX3RpbWVvdXQ7IGkrKykgew0KKwkJdTMyIG1lbXNpemUgPSBhZGV2
LT5uYmlvX2Z1bmNzLT5nZXRfbWVtc2l6ZShhZGV2KTsNCisNCisJCWlmIChtZW1zaXplICE9IDB4
ZmZmZmZmZmYpDQorCQkJYnJlYWs7DQorCQl1ZGVsYXkoMSk7DQorCX0NCisNCisJYW1kZ3B1X2F0
b21iaW9zX3NjcmF0Y2hfcmVnc19lbmdpbmVfaHVuZyhhZGV2LCBmYWxzZSk7DQorDQorCXJldHVy
biByZXQ7DQorfQ0KIHN0YXRpYyBpbnQgbnZfYXNpY19yZXNldChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikgIHsNCiANCkBAIC0yNzIsNiArMzA1LDggQEAgc3RhdGljIGludCBudl9hc2ljX3Jl
c2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIA0KIAlpZiAoc211X2JhY29faXNfc3Vw
cG9ydChzbXUpKSB7DQogCQlyZXQgPSBzbXVfYmFjb19yZXNldChzbXUpOw0KKwl9IGVsc2Ugew0K
KwkJcmV0ID0gbnZfYXNpY19tb2RlMV9yZXNldChhZGV2KTsNCiAJfQ0KIA0KIAlyZXR1cm4gcmV0
Ow0KLS0NCjIuMjIuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
