Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298E4A4D44
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Sep 2019 04:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8D589A5D;
	Mon,  2 Sep 2019 02:11:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760045.outbound.protection.outlook.com [40.107.76.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5EA89A57
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 02:11:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbbRhRVPLZWFggQRPbW7B1PH5sJLLG21teppCviE06pVzl8spnUhKCRPk2fU98AoRu80C2RlwTjcDpsPDBGAi8aytu8Z89db9y4RppRkp+zjVWfsKifGu/mGw+jVjKF/G+mvwNInBg2OF6Gx8AIFY/FpNMTmt4sR+57k2gb6KCCNXWhuTfjlrTwQHzEZb3AzoVof8VQSFfoleXLlmw9vKAD5L6nyMw7FnEUxyLkV+/b5Xe2jOwZHn+yY1yOPCQ9kgqdHVVXR2rLMPDF9y6UJXpUdMi7hRVLj4K5NKm/q53jZXSDTyXdZO9cr5thdx661pkt1vgQV70ski1+PYgpIWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0p/VCKOZWj2ejEdixQjwkiE3vOBEWr2arAkN+LGc/8=;
 b=n9rkvTM0uuX4nZhUdCKIYACYRGuD6vuSo2nxKDII+jT868UnZERcH2XdFXcvB9XTtup4+cnokFghmlKXbWXtKPcO3F0gli/5ledx1ZfgqN8cTn39+XSrI0B8nN9dUMo3fUcfOxY3atuv/q38UM37FSw3f3iJmmXyrykkhsPlaXfBtNw9il9FxmrjRXpRNMc+p346i9UR8PkBotBcXWiTSBEU9pbJ8bL8Ht/1Qgk6dqMNdrdbZJV4S0PlievlIJj9K0ecHvfAxPx5iEMjxwqB5BsF2dz/7TCa9owXclnH3Hao7+gGj4218iC7pD3IaxqTuX2xfIW4MvqETC96ML4JHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SN6PR12MB2813.namprd12.prod.outlook.com (52.135.100.27) by
 SN6PR12MB2846.namprd12.prod.outlook.com (52.135.103.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Mon, 2 Sep 2019 02:11:13 +0000
Received: from SN6PR12MB2813.namprd12.prod.outlook.com
 ([fe80::b806:60aa:1bb:9117]) by SN6PR12MB2813.namprd12.prod.outlook.com
 ([fe80::b806:60aa:1bb:9117%3]) with mapi id 15.20.2199.021; Mon, 2 Sep 2019
 02:11:13 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 2/4] drm/amdgpu: Hook EEPROM table to RAS
Thread-Topic: [PATCH 2/4] drm/amdgpu: Hook EEPROM table to RAS
Thread-Index: AQHVXy4Q51eD6etwc0exG3vqsg7dmacXqAew
Date: Mon, 2 Sep 2019 02:11:13 +0000
Message-ID: <SN6PR12MB2813A05D3E8BCC723AE50308F1BE0@SN6PR12MB2813.namprd12.prod.outlook.com>
References: <20190830122453.19703-1-tao.zhou1@amd.com>
 <20190830122453.19703-3-tao.zhou1@amd.com>
In-Reply-To: <20190830122453.19703-3-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0a6c25f-4acd-4557-bf25-08d72f4ad492
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2846; 
x-ms-traffictypediagnostic: SN6PR12MB2846:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB2846DD7C0FC60C820F7A6472F1BE0@SN6PR12MB2846.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(199004)(189003)(13464003)(81156014)(66476007)(66556008)(64756008)(66446008)(6636002)(9686003)(229853002)(53936002)(110136005)(6246003)(14454004)(2906002)(6116002)(3846002)(478600001)(6436002)(2501003)(53546011)(26005)(186003)(305945005)(76116006)(102836004)(76176011)(6506007)(7696005)(74316002)(66946007)(7736002)(33656002)(99286004)(52536014)(71190400001)(71200400001)(6306002)(55016002)(11346002)(446003)(476003)(486006)(966005)(8936002)(25786009)(4326008)(14444005)(256004)(8676002)(66066001)(81166006)(316002)(5660300002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2846;
 H:SN6PR12MB2813.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ItQPhVcaFfuchLiRqLzQoygP2ZMKh0597dWCk7i+r2+V4gK5D8B2aPZ0V4pHIUgHt6E/47iRvGKXZmyPUfD7llmXgxBEb3XaLe6M8Y9Q7OueSyN1b27Zs8PaVbh2DV03WnSZn6j1oykVf4zPHOzA7GnCMBSo9Yov0ogd4+205lVroIVo2C/V7ygg9I/RUGeDNQ6L8pId6sS12gfHDORZYkavCP5oH71sW4UIWytuWJiU49Dyv2hKdFh4ilqbxNY+doy/HDcY4jAvpS9zvy/vmmaYcxiHnaqvIu+Kh8Y1eErfTQsY3+0vnecP3owKFFPsQkRPpUnc6aSddNSjt6tugPCqh9m3/9UswXi7JQJ2vUW3ua9rzSjqFZAkgJ78ZPqxrGxkd6qZJXsp6UJC8bwMi36cuJ2izMq+aNQTP3h6VTo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a6c25f-4acd-4557-bf25-08d72f4ad492
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 02:11:13.5297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X5TlSvCwzo68qP1nfgq6KhwiKh3StWlLwZ4nAHRsbzEa4mh3gHUAaZQrEuhUkFo8SVsrc1NnHL9IqIiEfqoiSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2846
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0p/VCKOZWj2ejEdixQjwkiE3vOBEWr2arAkN+LGc/8=;
 b=P88z/8638N5I7t9iWUdg8Ng+1d+n7coO4olVIUiIBL/BLsS1HoKUbTtTxmW0hZ88cS+9/UCn+Tq5oZSOO0D6abz+GDeeXGq1sJ3fMUnsh3w0HYphmwtoIj+JQC7N/uT+c+4lVKSuTwWXqPx1Mrb2/SqCjLtFZXKkZI2xfV9xvdo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVGFvIFpob3UNClNlbnQ6
IEZyaWRheSwgQXVndXN0IDMwLCAyMDE5IDg6MjUgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29t
PjsgQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPjsgTGksIERlbm5pcyA8RGVubmlz
LkxpQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KQ2M6
IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDIvNF0gZHJt
L2FtZGdwdTogSG9vayBFRVBST00gdGFibGUgdG8gUkFTDQoNCnN1cHBvcnQgZWVwcm9tIHJlY29y
ZHMgbG9hZCBhbmQgc2F2ZSBmb3IgcmFzLCBtb3ZlIEVFUFJPTSByZWNvcmRzIHN0b3JpbmcgdG8g
YmFkIHBhZ2UgcmVzZXJ2aW5nDQoNClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFA
YW1kLmNvbT4NClNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpv
dnNreUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5jIHwgMTExICsrKysrKysrKysrKysrKysrKy0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA4MyBp
bnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuYw0KaW5kZXggMjQ2NjNlYzQxMjQ4Li4wMjEyMGFhM2NiNWQgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KQEAgLTEzNDgsNiArMTM0OCw3MiBA
QCBpbnQgYW1kZ3B1X3Jhc19hZGRfYmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LA0KIAlyZXR1cm4gcmV0Ow0KIH0NCiANCisvKg0KKyAqIHdyaXRlIGVycm9yIHJlY29yZCBhcnJh
eSB0byBlZXByb20sIHRoZSBmdW5jdGlvbiBzaG91bGQgYmUNCisgKiBwcm90ZWN0ZWQgYnkgcmVj
b3ZlcnlfbG9jaw0KKyAqLw0KK3N0YXRpYyBpbnQgYW1kZ3B1X3Jhc19zYXZlX2JhZF9wYWdlcyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgew0KKwlzdHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0g
YW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KTsNCisJc3RydWN0IHJhc19lcnJfaGFuZGxlcl9k
YXRhICpkYXRhOw0KKwlzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCA9
DQorCQkJCQkmYWRldi0+cHNwLnJhcy5yYXMtPmVlcHJvbV9jb250cm9sOw0KKwlpbnQgc2F2ZV9j
b3VudDsNCisNCisJaWYgKCFjb24gfHwgIWNvbi0+ZWhfZGF0YSkNCisJCXJldHVybiAwOw0KKw0K
KwlkYXRhID0gY29uLT5laF9kYXRhOw0KKwlpZiAoIWRhdGEpDQorCQlyZXR1cm4gMDsNCltHdWNo
dW5dU3VjaCBjaGVjayAoIWRhdGEpIGlzIHJlZHVuZGFudCBhbmQgbm90IG5lZWRlZC4gQXMgd2Ug
aGF2ZSBjaGVja2VkICFjb24tPmVoX2RhdGEgZWFybGllciwgYW5kIHRoZSB3aG9sZSBmdW5jdGlv
biBpcyBwcm90ZWN0ZWQgYnkgcmVjb3ZlcnlfbG9jay4NCg0KKwlzYXZlX2NvdW50ID0gZGF0YS0+
Y291bnQgLSBjb250cm9sLT5udW1fcmVjczsNCisJLyogb25seSBuZXcgZW50cmllcyBhcmUgc2F2
ZWQgKi8NCisJaWYgKHNhdmVfY291bnQgPiAwKQ0KKwkJaWYgKGFtZGdwdV9yYXNfZWVwcm9tX3By
b2Nlc3NfcmVjb2RzKCZjb24tPmVlcHJvbV9jb250cm9sLA0KKwkJCQkJCQkmZGF0YS0+YnBzW2Nv
bnRyb2wtPm51bV9yZWNzXSwNCisJCQkJCQkJdHJ1ZSwNCisJCQkJCQkJc2F2ZV9jb3VudCkpIHsN
CisJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBzYXZlIEVFUFJPTSB0YWJsZSBkYXRhISIpOw0KKwkJ
CXJldHVybiAtRUlPOw0KKwkJfQ0KKw0KKwlyZXR1cm4gMDsNCit9DQorDQorLyoNCisgKiByZWFk
IGVycm9yIHJlY29yZCBhcnJheSBpbiBlZXByb20gYW5kIHJlc2VydmUgZW5vdWdoIHNwYWNlIGZv
cg0KKyAqIHN0b3JpbmcgbmV3IGJhZCBwYWdlcw0KKyAqLw0KK3N0YXRpYyBpbnQgYW1kZ3B1X3Jh
c19sb2FkX2JhZF9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgew0KKwlzdHJ1Y3Qg
YW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCA9DQorCQkJCQkmYWRldi0+cHNwLnJh
cy5yYXMtPmVlcHJvbV9jb250cm9sOw0KKwlzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqYnBz
ID0gTlVMTDsNCisJaW50IHJldCA9IDA7DQorDQorCS8qIG5vIGJhZCBwYWdlIHJlY29yZCwgc2tp
cCBlZXByb20gYWNjZXNzICovDQorCWlmICghY29udHJvbC0+bnVtX3JlY3MpDQorCQlyZXR1cm4g
cmV0Ow0KKw0KKwlicHMgPSBrY2FsbG9jKGNvbnRyb2wtPm51bV9yZWNzLCBzaXplb2YoKmJwcyks
IEdGUF9LRVJORUwpOw0KKwlpZiAoIWJwcykNCisJCXJldHVybiAtRU5PTUVNOw0KKw0KKwlpZiAo
YW1kZ3B1X3Jhc19lZXByb21fcHJvY2Vzc19yZWNvZHMoY29udHJvbCwgYnBzLCBmYWxzZSwNCisJ
CWNvbnRyb2wtPm51bV9yZWNzKSkgew0KKwkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gbG9hZCBFRVBS
T00gdGFibGUgcmVjb3JkcyEiKTsNCisJCXJldCA9IC1FSU87DQorCQlnb3RvIG91dDsNCisJfQ0K
Kw0KKwlyZXQgPSBhbWRncHVfcmFzX2FkZF9iYWRfcGFnZXMoYWRldiwgYnBzLCBjb250cm9sLT5u
dW1fcmVjcyk7DQorDQorb3V0Og0KKwlrZnJlZShicHMpOw0KKwlyZXR1cm4gcmV0Ow0KK30NCisN
CiAvKiBjYWxsZWQgaW4gZ3B1IHJlY292ZXJ5L2luaXQgKi8NCiBpbnQgYW1kZ3B1X3Jhc19yZXNl
cnZlX2JhZF9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgIHsgQEAgLTEzNTUsNyAr
MTQyMSw3IEBAIGludCBhbWRncHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQ0KIAlzdHJ1Y3QgcmFzX2Vycl9oYW5kbGVyX2RhdGEgKmRhdGE7DQogCXVp
bnQ2NF90IGJwOw0KIAlzdHJ1Y3QgYW1kZ3B1X2JvICpibzsNCi0JaW50IGk7DQorCWludCBpLCBy
ZXQgPSAwOw0KIA0KIAlpZiAoIWNvbiB8fCAhY29uLT5laF9kYXRhKQ0KIAkJcmV0dXJuIDA7DQpA
QCAtMTM3NSw5ICsxNDQxLDExIEBAIGludCBhbWRncHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIAkJZGF0YS0+YnBzX2JvW2ldID0gYm87DQogCQlk
YXRhLT5sYXN0X3Jlc2VydmVkID0gaSArIDE7DQogCX0NCisNCisJcmV0ID0gYW1kZ3B1X3Jhc19z
YXZlX2JhZF9wYWdlcyhhZGV2KTsNCiBvdXQ6DQogCW11dGV4X3VubG9jaygmY29uLT5yZWNvdmVy
eV9sb2NrKTsNCi0JcmV0dXJuIDA7DQorCXJldHVybiByZXQ7DQogfQ0KIA0KIC8qIGNhbGxlZCB3
aGVuIGRyaXZlciB1bmxvYWQgKi8NCkBAIC0xNDA5LDMzICsxNDc3LDExIEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X3Jhc19yZWxlYXNlX2JhZF9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikN
CiAJcmV0dXJuIDA7DQogfQ0KIA0KLXN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19zYXZlX2JhZF9wYWdl
cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgLXsNCi0JLyogVE9ETw0KLQkgKiB3cml0ZSB0
aGUgYXJyYXkgdG8gZWVwcm9tIHdoZW4gU01VIGRpc2FibGVkLg0KLQkgKi8NCi0JcmV0dXJuIDA7
DQotfQ0KLQ0KLS8qDQotICogcmVhZCBlcnJvciByZWNvcmQgYXJyYXkgaW4gZWVwcm9tIGFuZCBy
ZXNlcnZlIGVub3VnaCBzcGFjZSBmb3INCi0gKiBzdG9yaW5nIG5ldyBiYWQgcGFnZXMNCi0gKi8N
Ci1zdGF0aWMgaW50IGFtZGdwdV9yYXNfbG9hZF9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpIC17DQotCXN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICpicHMgPSBOVUxMOw0K
LQlpbnQgcmV0Ow0KLQ0KLQlyZXQgPSBhbWRncHVfcmFzX2FkZF9iYWRfcGFnZXMoYWRldiwgYnBz
LA0KLQkJCQlhZGV2LT51bWMubWF4X3Jhc19lcnJfY250X3Blcl9xdWVyeSk7DQotDQotCXJldHVy
biByZXQ7DQotfQ0KLQ0KIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19yZWNvdmVyeV9pbml0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KSAgew0KIAlzdHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0gYW1k
Z3B1X3Jhc19nZXRfY29udGV4dChhZGV2KTsNCiAJc3RydWN0IHJhc19lcnJfaGFuZGxlcl9kYXRh
ICoqZGF0YSA9ICZjb24tPmVoX2RhdGE7DQorCWludCByZXQ7DQogDQogCSpkYXRhID0ga21hbGxv
YyhzaXplb2YoKipkYXRhKSwNCiAJCQlHRlBfS0VSTkVMfF9fR0ZQX1pFUk8pOw0KQEAgLTE0NDcs
OCArMTQ5MywxOCBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfcmVjb3ZlcnlfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikNCiAJYXRvbWljX3NldCgmY29uLT5pbl9yZWNvdmVyeSwgMCk7
DQogCWNvbi0+YWRldiA9IGFkZXY7DQogDQotCWFtZGdwdV9yYXNfbG9hZF9iYWRfcGFnZXMoYWRl
dik7DQotCWFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMoYWRldik7DQorCXJldCA9IGFtZGdw
dV9yYXNfZWVwcm9tX2luaXQoJmFkZXYtPnBzcC5yYXMucmFzLT5lZXByb21fY29udHJvbCk7DQor
CWlmIChyZXQpDQorCQlyZXR1cm4gcmV0Ow0KKw0KKwlpZiAoYWRldi0+cHNwLnJhcy5yYXMtPmVl
cHJvbV9jb250cm9sLm51bV9yZWNzKSB7DQorCQlyZXQgPSBhbWRncHVfcmFzX2xvYWRfYmFkX3Bh
Z2VzKGFkZXYpOw0KKwkJaWYgKHJldCkNCisJCQlyZXR1cm4gcmV0Ow0KKwkJcmV0ID0gYW1kZ3B1
X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyhhZGV2KTsNCisJCWlmIChyZXQpDQorCQkJcmV0dXJuIHJl
dDsNCisJfQ0KIA0KIAlyZXR1cm4gMDsNCiB9DQpAQCAtMTQ1OSw3ICsxNTE1LDYgQEAgc3RhdGlj
IGludCBhbWRncHVfcmFzX3JlY292ZXJ5X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
DQogCXN0cnVjdCByYXNfZXJyX2hhbmRsZXJfZGF0YSAqZGF0YSA9IGNvbi0+ZWhfZGF0YTsNCiAN
CiAJY2FuY2VsX3dvcmtfc3luYygmY29uLT5yZWNvdmVyeV93b3JrKTsNCi0JYW1kZ3B1X3Jhc19z
YXZlX2JhZF9wYWdlcyhhZGV2KTsNCiAJYW1kZ3B1X3Jhc19yZWxlYXNlX2JhZF9wYWdlcyhhZGV2
KTsNCiANCiAJbXV0ZXhfbG9jaygmY29uLT5yZWNvdmVyeV9sb2NrKTsNCi0tDQoyLjE3LjENCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZngg
bWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
