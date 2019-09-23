Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A45BB751
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 16:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C256E87C;
	Mon, 23 Sep 2019 14:57:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790077.outbound.protection.outlook.com [40.107.79.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACFE6E87C
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 14:57:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sym9HZNKTtuzfFWLhIOy9iJQQc3eVWXOOK/8HxeCI13/sMWkqaM++LoNMzk8oDFyTiU8oRAYLZbyW+KpA4BrCibu6RiEEwm8A5DwsDXbyNhb5+apa2tBJAONHGAODvxB2DjU5VJ/R6aM71fl9Bb6nL+2YjazEtGWv6xjTdMUzlsBa4uuPl0+elzLAoDEWyao8Don0x9Oo7OO4RrkV2u2xbPvwNcN0tu9eaxPX3IQv3snpsEn5+pWThU5XDCzA5VQu6rbXc0wFvMyHc/ORcRpJVQym0NtLx9IUIelF98qShcx9D0TVUx2tTDNvEnCE+X0fePDZP/HxfuSpzg2IyqipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aS/B6q7r6fDHEneg6mP9rI4LtNsVpvYk/Q0WZFWbSwc=;
 b=cCxS5lcxfhbrXdZn+na2r9nIdXXe9em84Jfgn7DSflcu6mvkt0VOZuMjknEDDOXVBe3uwOVrBabt53gF9CcD8ciAeX79vGKSy3nL0KSX+frFN7Eie5UloD1a6R9etw+dSGgADxidJy8yeueyndkOW2/n7KfahLTSeEOqgZPUet2A6odLTb8/UdOC/NBq6oDwpnmGIx65w9+g49zffpGCzQdjQgRdj6BuE4g4hYmua/6BcquUiwVUNI7fShShoVjKyUgq7Mq8S6TtmMJYJLtSOCkOtIU/9mVQO+0mSLFqREXvs/VaSfDH64xaFKaTTqKF67UgX3vnNGyxHY0np7N+oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1791.namprd12.prod.outlook.com (10.175.55.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Mon, 23 Sep 2019 14:57:23 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0%11]) with mapi id 15.20.2284.023; Mon, 23 Sep
 2019 14:57:22 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Gong, Curry" <Curry.Gong@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: Use mode2 mode to perform GPU RESET for
 Renoir
Thread-Topic: [PATCH 2/2] drm/amdgpu: Use mode2 mode to perform GPU RESET for
 Renoir
Thread-Index: AQHVcdYsUxCoCNq+UU+5uolhQUOm+qc5WrkA
Date: Mon, 23 Sep 2019 14:57:22 +0000
Message-ID: <b7990199-5b13-16de-7c8e-0ef77921aa91@amd.com>
References: <1569219248-29457-1-git-send-email-curry.gong@amd.com>
 <1569219248-29457-2-git-send-email-curry.gong@amd.com>
In-Reply-To: <1569219248-29457-2-git-send-email-curry.gong@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::39) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ad76f62-1801-4587-b7e8-08d7403656e6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1791; 
x-ms-traffictypediagnostic: MWHPR12MB1791:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB179161189AC665FB41EE29A9EA850@MWHPR12MB1791.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(189003)(199004)(31686004)(6486002)(229853002)(6506007)(36756003)(386003)(52116002)(53546011)(305945005)(81166006)(186003)(76176011)(7736002)(2501003)(25786009)(102836004)(3846002)(6116002)(64756008)(66446008)(11346002)(2906002)(66946007)(478600001)(446003)(26005)(71200400001)(6246003)(71190400001)(486006)(476003)(2616005)(256004)(99286004)(31696002)(316002)(66476007)(14454004)(5660300002)(66556008)(6436002)(66066001)(86362001)(110136005)(6512007)(81156014)(8676002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1791;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fWYmQ5PeV2dU4X/qaih0U7c3Gqto8MGe4feG81astJ75EGpf2ztjHcyYbIDU6wlpicvLBtdJeykjdkmMOBnKTS3pe3+CWDYuKOsNCwdKsNVkjmOr+z/K8hB9y+GZu011yFIHK5OSO1YwGixPUOLKDdbnR+yhkNkAQXazDcySRQMFiW5WV4OBZcLoxHHYCdUgBq7orxGgzp/P7U7/3N6yYbLdSxfjtAQTznq2smAHciRQaXphG2hmAPRmKsDq9uaIoCwY/ifUHfkK0gCNnsqElhdh9s2MSRkhvo5SBKlWxtbs0XqH/etj4biXItYN+mSpW0eUQ4Ms3OMvqhVAo3k9kOIoXHH7Z1n7/Doa4JCbslbip0/zsjCieiEr4+brZoJ/fNGPV/jIDPUm4u9NI576+xp05Tda82drIrVp1sOhhIU=
Content-ID: <454D9DE64BD5DF408B7B0EBBB4766009@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad76f62-1801-4587-b7e8-08d7403656e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 14:57:22.8676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CpwLd5wo5yfAfd3hwyiLhKw8NS2dag6Ro0saBnCgW5fMC3uACyaBZKUe8o0uH1BOhavoIOm6OpL02vT4UYfjLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1791
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aS/B6q7r6fDHEneg6mP9rI4LtNsVpvYk/Q0WZFWbSwc=;
 b=G8VtDwm7kOhlHSluwbdLgLreCI29X+whTtD5vi7jddPn4QsfUZfbUSdK2IfczWRwdlBt8dWE4r7wXKQiOEKRx8tIx86YC6YKKN1BU2qkopBj8dJg77hcD2qcplBWdt2Fg7wt5TckkOvN81K/Tyuk54TAH5Sju4OMzBYZpy6DgLQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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

DQpPbiA5LzIzLzE5IDI6MTQgQU0sIGNoZW4gZ29uZyB3cm90ZToNCj4gU2lnbmVkLW9mZi1ieTog
Y2hlbiBnb25nIDxjdXJyeS5nb25nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCAzICsrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+IGluZGV4IDU4ODE4
NzYxLi4wZjYzOWRmOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c29jMTUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+IEBA
IC01MTQsNiArNTE0LDggQEAgc3RhdGljIGludCBzb2MxNV9hc2ljX2JhY29fcmVzZXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAgDQo+ICAgc3RhdGljIGludCBzb2MxNV9tb2RlMl9y
ZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICB7DQo+ICsJaWYgKGlzX3N1cHBv
cnRfc3dfc211KGFkZXYpKQ0KPiArCQlyZXR1cm4gc211X21vZGUyX3Jlc2V0KCZhZGV2LT5zbXUp
Ow0KDQoNClBpY2Fzc28gcmVzZXQgaXMgYWxzbyBTTVUgYmFzZWQgc28gSSB3b3VsZCB1bmlmeSB0
aGUgY29kZSBmb3IgYm90aCANCnJlc2V0cyB1bmRlciBzbXVfbW9kZTJfcmVzZXQgYW5kIGFscmVh
ZHkgaW5zaWRlIHdvdWxkIG1ha2UgdGhlIA0KZGlzdGluY3Rpb24gYmV0d2VlbiBQaWNhc3NvKFJB
VkVOKSBhbmQgUmVub2lyLiBBcGFydCBmcm9tIHRoYXQgdGhlIA0Kc2VyaWVzIGxvb2tzIGdvb2Qg
dGhlIG1lLg0KDQpSZXZpZXdlZC1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92
c2t5QGFtZC5jb20+DQoNCkFuZHJleQ0KDQoNCj4gICAJaWYgKCFhZGV2LT5wb3dlcnBsYXkucHBf
ZnVuY3MgfHwNCj4gICAJICAgICFhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPmFzaWNfcmVzZXRf
bW9kZV8yKQ0KPiAgIAkJcmV0dXJuIC1FTk9FTlQ7DQo+IEBAIC01MjgsNiArNTMwLDcgQEAgc29j
MTVfYXNpY19yZXNldF9tZXRob2Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAgDQo+
ICAgCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7DQo+ICAgCWNhc2UgQ0hJUF9SQVZFTjoNCj4g
KwljYXNlIENISVBfUkVOT0lSOg0KPiAgIAkJcmV0dXJuIEFNRF9SRVNFVF9NRVRIT0RfTU9ERTI7
DQo+ICAgCWNhc2UgQ0hJUF9WRUdBMTA6DQo+ICAgCWNhc2UgQ0hJUF9WRUdBMTI6DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
