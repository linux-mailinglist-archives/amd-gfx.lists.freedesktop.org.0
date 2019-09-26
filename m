Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C83BF9C9
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 21:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60AB6EDEE;
	Thu, 26 Sep 2019 19:05:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710074.outbound.protection.outlook.com [40.107.71.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEE96EDEE
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 19:05:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oB4nWrl/IkMbOtyXTy3cbJPWPK+bFy7x1JvHaegOS/2K7yHWdsMP5dkR2rlS60mS/KoAEsg/7P7rdvTaN1ZOucCV5ljDCE+AFb2DXilMkL6YA5n+P/DolfTVuVZbTbxAtYvcCIJrjUCjzLIzAvSzfA9H0Oe64nP5dzGVUOF1c8yFDZQX49VRLJyEiPZyBYwGBDby98GkAfJ6JuzTCrv3Z2Ax8scCvtyEqKKB3BKphVBIXBy4VvCou1un6T19LS/aCfA6CLYrG9Zz3/COeQMNW+8dvqYXSOCgctQeeyTzZMEZv6BKiL+OD0F5W0ht3tfIz4p8kcdkClGR/zFLeGT7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZeYMrdrXfSJB+QbmByrC684bDYriVhnB4kgdtQycv4=;
 b=ZxxD1GpNPD0+k1nqfza4RzgwUKQu/5Cj9o/B+kfxqqLs/vGufwH1PEB3J5vYZ4pIhDmlfiwO4cg/zSZLL3XuCYFP3OopwVcHSJYEkHal5xqVTAQ8eespNVkIdoiSK5w2JBes80DOcR3aaJDKG5tzVo9wgZyChuI7+WWXXC2VTT4+ZnoDiil/17PB/6suQt5zaRNzzmuNVYdtqtlc5r0hbWLbm9GZ7V3nS2Px9qmyrlUAMAfzUJcVESZjvQ0nxhHcq5LJQjMv4f7SEPxE42ZvcCQ73hH78ILxM18zaNAGdAvrYLWCJGN6+vwjZLTT8VuDXgocbJVz0xBMXSX9jVgtdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3930.namprd12.prod.outlook.com (10.255.174.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 19:05:50 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 19:05:50 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] drm/amdkfd: Move the control stack on GFX10 to
 userspace buffer
Thread-Topic: [PATCH 1/6] drm/amdkfd: Move the control stack on GFX10 to
 userspace buffer
Thread-Index: AQHVdJmfl/AON9ofHUyHILchJs7hy6c+UZ2A
Date: Thu, 26 Sep 2019 19:05:50 +0000
Message-ID: <5befe9a4-9cd8-b592-d30e-56e2623ed5ed@amd.com>
References: <20190926183826.18813-1-Yong.Zhao@amd.com>
In-Reply-To: <20190926183826.18813-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::22) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 035c9d31-0e8b-4de9-7324-08d742b48bda
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3930; 
x-ms-traffictypediagnostic: DM6PR12MB3930:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3930E253BC944C6DC6D61FC292860@DM6PR12MB3930.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(189003)(199004)(6512007)(6436002)(86362001)(31696002)(14454004)(66556008)(66446008)(64756008)(11346002)(446003)(305945005)(6246003)(486006)(2616005)(476003)(2906002)(186003)(25786009)(110136005)(5660300002)(66476007)(66946007)(2501003)(58126008)(8676002)(256004)(14444005)(71200400001)(99286004)(81156014)(81166006)(36756003)(508600001)(65806001)(65956001)(66066001)(8936002)(6486002)(76176011)(102836004)(7736002)(3846002)(386003)(6506007)(53546011)(229853002)(71190400001)(31686004)(26005)(6116002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3930;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rBoLnk0OWGwXF49DR96oQKgKWZb0MvcNq1ZQCieUsV+bOSGV5Rt6HHK0foixAEPKCjpwOja1BrRV8L+QfGivJQx8zDp0nout2I/CIuan7fAIlgMtrt1BwTDrzNP1hV5znLBKcqGyfkz6SBziSJZ5/VlwBvhGDBoWJX2TE6o9S0nhCzUHrC6CmoyMN7ylmUK31xI2gHnoczqKxc+SgZv6a5uB0HOFDlBWONYQP5KMeKPaA6mfW717VElZ/DMca0HmLW2RmzKwzeRTFjSWRO/2PCmITSXZhQV4TGLq7YCGFu3QoHfkF4OmRNFtejto8nkyAGNwWLkF7rAvDztUVxfAOTiVnqsTbJxTK/huVQ/6E1VjcNKl46t1kZx/5z+KW9bhb6bdBzpDtjvs/wcz0vCNjSJYCRH0+DrkvUH/XeQrCqA=
Content-ID: <2ACB2BDFDA7E274ABCD656CC8CD0C1AA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 035c9d31-0e8b-4de9-7324-08d742b48bda
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 19:05:50.5639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3p1+YbGyB2fF1JBqY1zQtU409iUTLKwR89wfRME87dzOZ77oFaCa8qopgJ7oZJ/o2mNoCBYZmUXmswWySlsmtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3930
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZeYMrdrXfSJB+QbmByrC684bDYriVhnB4kgdtQycv4=;
 b=FrN+YQANQGuII5NcO3LRJYsGHGNdm3ywFpmvO2loH2UWE7zxuJn6J9Ny8wrnyViwnVXP8X5mzoiNkIXyd9N+VmrK9tF6cEhpLWzWJ9B7I5DfXyOj8gNH9OdkkX/suXxeK24gh27N8ofyb7TTEjccJMqnkQHcg23uyfWXXez1AAs=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGF0Y2hlcyAxLTMgYW5kIHBhdGNoIDUgYXJlDQoNClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGlu
ZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KU2VlIHNlcGFyYXRlIGVtYWlscyBmb3IgcGF0
Y2hlcyA0IGFuZCA2Lg0KDQpPbiAyMDE5LTA5LTI2IDI6MzggcC5tLiwgWmhhbywgWW9uZyB3cm90
ZToNCj4gVGhlIEdGWDEwIGRvZXMgbm90IHJlcXVpcmUgdGhlIGNvbnRyb2wgc3RhY2sgdG8gYmUg
cmlnaHQgYWZ0ZXIgbXFkDQo+IGJ1ZmZlciBhbnkgbW9yZSwgc28gbW92ZSBpdCBiYWNrIHRvIHVz
ZXJzYXBjZSBhbGxvY2F0ZWQgQ1NXUiBidWZmZXIuDQo+DQo+IENoYW5nZS1JZDogSTQ0NmM5Njg1
NTQ5YTA5YWM4ODQ2YTQyZWUyMmQ4NmNmYjkzZmQ5OGMNCj4gU2lnbmVkLW9mZi1ieTogWW9uZyBa
aGFvIDxZb25nLlpoYW9AYW1kLmNvbT4NCj4gLS0tDQo+ICAgLi4uL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMgIHwgMzcgKystLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jDQo+IGlu
ZGV4IDI5ZDUwZDZhZjlkNy4uZTJmYjc2MjQ3ZjQ3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jDQo+IEBAIC02OSwzNSArNjks
MTMgQEAgc3RhdGljIHZvaWQgdXBkYXRlX2N1X21hc2soc3RydWN0IG1xZF9tYW5hZ2VyICptbSwg
dm9pZCAqbXFkLA0KPiAgIHN0YXRpYyBzdHJ1Y3Qga2ZkX21lbV9vYmogKmFsbG9jYXRlX21xZChz
dHJ1Y3Qga2ZkX2RldiAqa2ZkLA0KPiAgIAkJc3RydWN0IHF1ZXVlX3Byb3BlcnRpZXMgKnEpDQo+
ICAgew0KPiAtCWludCByZXR2YWw7DQo+IC0Jc3RydWN0IGtmZF9tZW1fb2JqICptcWRfbWVtX29i
aiA9IE5VTEw7DQo+ICsJc3RydWN0IGtmZF9tZW1fb2JqICptcWRfbWVtX29iajsNCj4gICANCj4g
LQkvKiBGcm9tIFY5LCAgZm9yIENXU1IsIHRoZSBjb250cm9sIHN0YWNrIGlzIGxvY2F0ZWQgb24g
dGhlIG5leHQgcGFnZQ0KPiAtCSAqIGJvdW5kYXJ5IGFmdGVyIHRoZSBtcWQsIHdlIHdpbGwgdXNl
IHRoZSBndHQgYWxsb2NhdGlvbiBmdW5jdGlvbg0KPiAtCSAqIGluc3RlYWQgb2Ygc3ViLWFsbG9j
YXRpb24gZnVuY3Rpb24uDQo+IC0JICovDQo+IC0JaWYgKGtmZC0+Y3dzcl9lbmFibGVkICYmIChx
LT50eXBlID09IEtGRF9RVUVVRV9UWVBFX0NPTVBVVEUpKSB7DQo+IC0JCW1xZF9tZW1fb2JqID0g
a3phbGxvYyhzaXplb2Yoc3RydWN0IGtmZF9tZW1fb2JqKSwgR0ZQX05PSU8pOw0KPiAtCQlpZiAo
IW1xZF9tZW1fb2JqKQ0KPiAtCQkJcmV0dXJuIE5VTEw7DQo+IC0JCXJldHZhbCA9IGFtZGdwdV9h
bWRrZmRfYWxsb2NfZ3R0X21lbShrZmQtPmtnZCwNCj4gLQkJCUFMSUdOKHEtPmN0bF9zdGFja19z
aXplLCBQQUdFX1NJWkUpICsNCj4gLQkJCQlBTElHTihzaXplb2Yoc3RydWN0IHYxMF9jb21wdXRl
X21xZCksIFBBR0VfU0laRSksDQo+IC0JCQkmKG1xZF9tZW1fb2JqLT5ndHRfbWVtKSwNCj4gLQkJ
CSYobXFkX21lbV9vYmotPmdwdV9hZGRyKSwNCj4gLQkJCSh2b2lkICopJihtcWRfbWVtX29iai0+
Y3B1X3B0ciksIHRydWUpOw0KPiAtCX0gZWxzZSB7DQo+IC0JCXJldHZhbCA9IGtmZF9ndHRfc2Ff
YWxsb2NhdGUoa2ZkLCBzaXplb2Yoc3RydWN0IHYxMF9jb21wdXRlX21xZCksDQo+IC0JCQkJJm1x
ZF9tZW1fb2JqKTsNCj4gLQl9DQo+IC0NCj4gLQlpZiAocmV0dmFsKSB7DQo+IC0JCWtmcmVlKG1x
ZF9tZW1fb2JqKTsNCj4gKwlpZiAoa2ZkX2d0dF9zYV9hbGxvY2F0ZShrZmQsIHNpemVvZihzdHJ1
Y3QgdjEwX2NvbXB1dGVfbXFkKSwNCj4gKwkJCSZtcWRfbWVtX29iaikpDQo+ICAgCQlyZXR1cm4g
TlVMTDsNCj4gLQl9DQo+ICAgDQo+ICAgCXJldHVybiBtcWRfbWVtX29iajsNCj4gLQ0KPiAgIH0N
Cj4gICANCj4gICBzdGF0aWMgdm9pZCBpbml0X21xZChzdHJ1Y3QgbXFkX21hbmFnZXIgKm1tLCB2
b2lkICoqbXFkLA0KPiBAQCAtMjUwLDE0ICsyMjgsNyBAQCBzdGF0aWMgaW50IGRlc3Ryb3lfbXFk
KHN0cnVjdCBtcWRfbWFuYWdlciAqbW0sIHZvaWQgKm1xZCwNCj4gICBzdGF0aWMgdm9pZCBmcmVl
X21xZChzdHJ1Y3QgbXFkX21hbmFnZXIgKm1tLCB2b2lkICptcWQsDQo+ICAgCQkJc3RydWN0IGtm
ZF9tZW1fb2JqICptcWRfbWVtX29iaikNCj4gICB7DQo+IC0Jc3RydWN0IGtmZF9kZXYgKmtmZCA9
IG1tLT5kZXY7DQo+IC0NCj4gLQlpZiAobXFkX21lbV9vYmotPmd0dF9tZW0pIHsNCj4gLQkJYW1k
Z3B1X2FtZGtmZF9mcmVlX2d0dF9tZW0oa2ZkLT5rZ2QsIG1xZF9tZW1fb2JqLT5ndHRfbWVtKTsN
Cj4gLQkJa2ZyZWUobXFkX21lbV9vYmopOw0KPiAtCX0gZWxzZSB7DQo+IC0JCWtmZF9ndHRfc2Ff
ZnJlZShtbS0+ZGV2LCBtcWRfbWVtX29iaik7DQo+IC0JfQ0KPiArCWtmZF9ndHRfc2FfZnJlZSht
bS0+ZGV2LCBtcWRfbWVtX29iaik7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBib29sIGlzX29j
Y3VwaWVkKHN0cnVjdCBtcWRfbWFuYWdlciAqbW0sIHZvaWQgKm1xZCwNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
