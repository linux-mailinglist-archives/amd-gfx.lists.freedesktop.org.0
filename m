Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA13BF94F
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 20:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26016EDD8;
	Thu, 26 Sep 2019 18:38:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760047.outbound.protection.outlook.com [40.107.76.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187CC6EDD8
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 18:38:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=co4N++KZLeg0dGIwJ6098oN8S9v6PMeXxdiVoRsUGg4uOnGsU7yantwjXxogvFNr1SFnNaYZ50mAXdeWiD7UcvKPNk4NqX3s1IYEWiAZoIHcBJyBjtNKFEt2cJWsalr8b8twitFL6778Xkszo9CtS7natTG/Jd97mAcdgq66Ulyxh/qWZF3fGblfG3St88FgsN0e/GqmmVIEw3qCIO7O24J1PIiRXyQ3XPPJk8JBg2ke2NdbWU/cIsk024Y5o17dbO82RiQFhVyjnlIneSssviDPl15pIhcGUVGW27WHJkYfyfRc/xG4ewkdf5hVpBMDts8ZQKMlUmqVzG1S4+q22g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSoRrKeKjyMY6TPlbNlFNTghxuzQWCphiapzQ6McrGI=;
 b=aqxbX9ur4IKdbiTDxw8Ziqzwy+8X2rfOmDtsjiBjmBjgnQ4P4l/Rkjrb36yc3F+NsWoG3zgqQT/nibmg6GPlEDCu1O5GSz0aYIeVlEmtHjYrARSe5bEzKPmtxYTJGtrz0z+5+IHcqK2yKG4JBsKKOUk5dw4ERC7pdeSnWsRQnH+NFtlASRia43ZZZuIwnqQRuTiEr1TD5Kt0tBDkyUM9NpRkKa93hpuRvYMO3OlvqPj4o3Zj3IuRhT85ZCB4/qVWQO5ukATUcs6v2nlzKvHq0/VDmph17f1EIK4gTD8jort/MKu81DkQ7q8dSXivv7vw8F9xRyIUHjvhCmBrwihZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 18:38:49 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 18:38:49 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/6] drm/amdkfd: Record vmid pasid mapping in the driver
Thread-Topic: [PATCH 4/6] drm/amdkfd: Record vmid pasid mapping in the driver
Thread-Index: AQHVdJmiJHW7pe1IjE+dvaqHmLzZQQ==
Date: Thu, 26 Sep 2019 18:38:48 +0000
Message-ID: <20190926183826.18813-4-Yong.Zhao@amd.com>
References: <20190926183826.18813-1-Yong.Zhao@amd.com>
In-Reply-To: <20190926183826.18813-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44)
 To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 223a350c-20c0-404f-6f43-08d742b0c534
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3466; 
x-ms-traffictypediagnostic: DM6PR12MB3466:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3466454599AA449EF1918BD3F0860@DM6PR12MB3466.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(11346002)(476003)(6436002)(305945005)(7736002)(50226002)(14454004)(8936002)(81156014)(81166006)(8676002)(256004)(5660300002)(2351001)(6512007)(4326008)(86362001)(316002)(76176011)(2501003)(2906002)(186003)(3846002)(6116002)(99286004)(52116002)(71200400001)(71190400001)(102836004)(25786009)(1076003)(26005)(36756003)(66066001)(6916009)(6506007)(386003)(478600001)(64756008)(66556008)(5640700003)(486006)(66446008)(446003)(66946007)(2616005)(6486002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3466;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QsEt+v5aUx861ZveafRxCm6nEfDAti0XnfXccXWGsq6pO8DUYYoC6B47d8+UJIRvYswxxY/czLLl9yUJ2K2ispPkmktzpX8UXN2Daj7kZEvndLwOEPUBIsP/iyuyMRnHhAEusu/4qJX7ReHFXLBvYeEg4BhSgZDrxmxCub+ZIZk6Kn7w8vh8ABkdqKGq35cG88IdALor9D6jjDrOgx3pLkpBMHxX/0sloOagw71JVEluvWlaVsPuknmzptKBKsXvwZq0V3FoAVTMbQ6U8SHh1KWdNQ47uGgIFMfd9/WHF++rIBNS76l7msWQF/2fsriHLABv8sA/vHNkJN2R1IhMccwvqHDBW65PIOaRQlgruNYqZTGduw4ym0NBi4QyJZu6ilCH/S1mb2mtYlaXbHOAIQ+YpGsrunaL7kFLCBoBAGc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223a350c-20c0-404f-6f43-08d742b0c534
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 18:38:48.8638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TeFbTuaaGGLvzBUTJuRmMfPj1k7D6+017Di5nfUdcwxzdbA2AOv/23l9TNc8J8PI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3466
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSoRrKeKjyMY6TPlbNlFNTghxuzQWCphiapzQ6McrGI=;
 b=fR4+J/NF9DQ0ax978qTq0VmPpiRzM3Z4uTH0BHr5Hxr4ToIEpezLuz2qQp28CumAs76SXLNSoxJjip9C7OZrKVLpPVes2XFr6gKhkpiyMyH+oSUE/i+HAcPfK2ci0GSVtP9sq9Y7YdZwI0yROi1hkAf1xyRreNm3u2kmUPeEjJY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBtYWtlcyBwb3NzaWJsZSB0aGUgdm1pZCBwYXNpZCBtYXBwaW5nIHF1ZXJ5IHRocm91Z2gg
c29mdHdhcmUuCgpDaGFuZ2UtSWQ6IEliNTM5YWFlMjc3YTIyN2NjMzlmNjQ2OWFlMjNjNDZjNGQy
ODliODdiClNpZ25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+Ci0tLQog
Li4uL2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIHwgMzQgKysrKysr
KysrKysrKy0tLS0tLQogLi4uL2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdl
ci5oIHwgIDMgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZV9xdWV1ZV9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
X3F1ZXVlX21hbmFnZXIuYwppbmRleCBlN2YwYTMyZTBlNDQuLmQwMDZhZGVmZWY1NSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2Vy
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5h
Z2VyLmMKQEAgLTIyNCwyMCArMjI0LDMwIEBAIHN0YXRpYyBpbnQgYWxsb2NhdGVfdm1pZChzdHJ1
Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwKIAkJCXN0cnVjdCBxY21fcHJvY2Vzc19kZXZp
Y2UgKnFwZCwKIAkJCXN0cnVjdCBxdWV1ZSAqcSkKIHsKLQlpbnQgYml0LCBhbGxvY2F0ZWRfdm1p
ZDsKKwlpbnQgaWR4ID0gLTEsIGFsbG9jYXRlZF92bWlkLCBpOwogCi0JaWYgKGRxbS0+dm1pZF9i
aXRtYXAgPT0gMCkKKwlmb3IgKGkgPSAwOyBpIDwgZHFtLT5kZXYtPnZtX2luZm8udm1pZF9udW1f
a2ZkOyBpKyspIHsKKwkJaWYgKCFkcW0tPnZtaWRfcGFzaWRbaV0pIHsKKwkJCWlkeCA9IGk7CisJ
CQlicmVhazsKKwkJfQorCX0KKworCWlmIChpZHggPCAwKSB7CisJCXByX2Vycigibm8gbW9yZSB2
bWlkIHRvIGFsbG9jYXRlXG4iKTsKIAkJcmV0dXJuIC1FTk9NRU07CisJfQorCisJZHFtLT52bWlk
X3Bhc2lkW2lkeF0gPSBxLT5wcm9jZXNzLT5wYXNpZDsKIAotCWJpdCA9IGZmcyhkcW0tPnZtaWRf
Yml0bWFwKSAtIDE7Ci0JZHFtLT52bWlkX2JpdG1hcCAmPSB+KDEgPDwgYml0KTsKKwlhbGxvY2F0
ZWRfdm1pZCA9IGlkeCArIGRxbS0+ZGV2LT52bV9pbmZvLmZpcnN0X3ZtaWRfa2ZkOworCXByX2Rl
YnVnKCJ2bWlkIGFsbG9jYXRlZDogJWRcbiIsIGFsbG9jYXRlZF92bWlkKTsKKworCXNldF9wYXNp
ZF92bWlkX21hcHBpbmcoZHFtLCBxLT5wcm9jZXNzLT5wYXNpZCwgYWxsb2NhdGVkX3ZtaWQpOwog
Ci0JYWxsb2NhdGVkX3ZtaWQgPSBiaXQgKyBkcW0tPmRldi0+dm1faW5mby5maXJzdF92bWlkX2tm
ZDsKLQlwcl9kZWJ1Zygidm1pZCBhbGxvY2F0aW9uICVkXG4iLCBhbGxvY2F0ZWRfdm1pZCk7CiAJ
cXBkLT52bWlkID0gYWxsb2NhdGVkX3ZtaWQ7CiAJcS0+cHJvcGVydGllcy52bWlkID0gYWxsb2Nh
dGVkX3ZtaWQ7CiAKLQlzZXRfcGFzaWRfdm1pZF9tYXBwaW5nKGRxbSwgcS0+cHJvY2Vzcy0+cGFz
aWQsIHEtPnByb3BlcnRpZXMudm1pZCk7CiAJcHJvZ3JhbV9zaF9tZW1fc2V0dGluZ3MoZHFtLCBx
cGQpOwogCiAJLyogcXBkLT5wYWdlX3RhYmxlX2Jhc2UgaXMgc2V0IGVhcmxpZXIgd2hlbiByZWdp
c3Rlcl9wcm9jZXNzKCkKQEAgLTI3OCw3ICsyODgsNyBAQCBzdGF0aWMgdm9pZCBkZWFsbG9jYXRl
X3ZtaWQoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sCiAJCQkJc3RydWN0IHFjbV9w
cm9jZXNzX2RldmljZSAqcXBkLAogCQkJCXN0cnVjdCBxdWV1ZSAqcSkKIHsKLQlpbnQgYml0ID0g
cXBkLT52bWlkIC0gZHFtLT5kZXYtPnZtX2luZm8uZmlyc3Rfdm1pZF9rZmQ7CisJaW50IGlkeDsK
IAogCS8qIE9uIEdGWCB2NywgQ1AgZG9lc24ndCBmbHVzaCBUQyBhdCBkZXF1ZXVlICovCiAJaWYg
KHEtPmRldmljZS0+ZGV2aWNlX2luZm8tPmFzaWNfZmFtaWx5ID09IENISVBfSEFXQUlJKQpAQCAt
MjkwLDcgKzMwMCw5IEBAIHN0YXRpYyB2b2lkIGRlYWxsb2NhdGVfdm1pZChzdHJ1Y3QgZGV2aWNl
X3F1ZXVlX21hbmFnZXIgKmRxbSwKIAkvKiBSZWxlYXNlIHRoZSB2bWlkIG1hcHBpbmcgKi8KIAlz
ZXRfcGFzaWRfdm1pZF9tYXBwaW5nKGRxbSwgMCwgcXBkLT52bWlkKTsKIAotCWRxbS0+dm1pZF9i
aXRtYXAgfD0gKDEgPDwgYml0KTsKKwlpZHggPSBxcGQtPnZtaWQgLSBkcW0tPmRldi0+dm1faW5m
by5maXJzdF92bWlkX2tmZDsKKwlkcW0tPnZtaWRfcGFzaWRbaWR4XSA9IDA7CisKIAlxcGQtPnZt
aWQgPSAwOwogCXEtPnByb3BlcnRpZXMudm1pZCA9IDA7CiB9CkBAIC0xMDE3LDcgKzEwMjksOCBA
QCBzdGF0aWMgaW50IGluaXRpYWxpemVfbm9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFn
ZXIgKmRxbSkKIAkJCQlkcW0tPmFsbG9jYXRlZF9xdWV1ZXNbcGlwZV0gfD0gMSA8PCBxdWV1ZTsK
IAl9CiAKLQlkcW0tPnZtaWRfYml0bWFwID0gKDEgPDwgZHFtLT5kZXYtPnZtX2luZm8udm1pZF9u
dW1fa2ZkKSAtIDE7CisJZHFtLT52bWlkX3Bhc2lkID0ga2NhbGxvYyhkcW0tPmRldi0+dm1faW5m
by52bWlkX251bV9rZmQsCisJCQlzaXplb2YodWludDE2X3QpLCBHRlBfS0VSTkVMKTsKIAlkcW0t
PnNkbWFfYml0bWFwID0gfjBVTEwgPj4gKDY0IC0gZ2V0X251bV9zZG1hX3F1ZXVlcyhkcW0pKTsK
IAlkcW0tPnhnbWlfc2RtYV9iaXRtYXAgPSB+MFVMTCA+PiAoNjQgLSBnZXRfbnVtX3hnbWlfc2Rt
YV9xdWV1ZXMoZHFtKSk7CiAKQEAgLTEwMzAsNiArMTA0Myw3IEBAIHN0YXRpYyB2b2lkIHVuaW5p
dGlhbGl6ZShzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSkKIAogCVdBUk5fT04oZHFt
LT5xdWV1ZV9jb3VudCA+IDAgfHwgZHFtLT5wcm9jZXNzZXNfY291bnQgPiAwKTsKIAorCWtmcmVl
KGRxbS0+dm1pZF9wYXNpZCk7CiAJa2ZyZWUoZHFtLT5hbGxvY2F0ZWRfcXVldWVzKTsKIAlmb3Ig
KGkgPSAwIDsgaSA8IEtGRF9NUURfVFlQRV9NQVggOyBpKyspCiAJCWtmcmVlKGRxbS0+bXFkX21n
cnNbaV0pOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZV9xdWV1ZV9tYW5hZ2VyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
X3F1ZXVlX21hbmFnZXIuaAppbmRleCBlZWQ4Zjk1MGI2NjMuLjY3YjVlNWZhZGQ5NSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2Vy
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5h
Z2VyLmgKQEAgLTE4OCw3ICsxODgsOCBAQCBzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgewog
CXVuc2lnbmVkIGludAkJKmFsbG9jYXRlZF9xdWV1ZXM7CiAJdWludDY0X3QJCXNkbWFfYml0bWFw
OwogCXVpbnQ2NF90CQl4Z21pX3NkbWFfYml0bWFwOwotCXVuc2lnbmVkIGludAkJdm1pZF9iaXRt
YXA7CisJLyogdGhlIHBhc2lkIG1hcHBpbmcgZm9yIGVhY2gga2ZkIHZtaWQgKi8KKwl1aW50MTZf
dAkJKnZtaWRfcGFzaWQ7CiAJdWludDY0X3QJCXBpcGVsaW5lc19hZGRyOwogCXN0cnVjdCBrZmRf
bWVtX29iagkqcGlwZWxpbmVfbWVtOwogCXVpbnQ2NF90CQlmZW5jZV9ncHVfYWRkcjsKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
