Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE0DBFDD6
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 06:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6E96EE47;
	Fri, 27 Sep 2019 04:08:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720045.outbound.protection.outlook.com [40.107.72.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF996EE47
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 04:08:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1hfSc2/T76BtebBs6xhenSlAtJPodnmDFhAX6kt3JxDusOWHo0Vro3jmIBcN2+7M765GzlSfveFz+tcLEbTQM4wLAZgoxWBctm61aO0zxq2q4RDx6UArEyl2O2Et7syQgSQ5Y9AInKWE+I95tfg6PSJGlQohEfn6Ma4+uc2LVmddD0/CtjAH286zXzPM5kBUIvdZ37R/AVXlneMR3DqLo7b7/hQffLC4i0bb102XhqR7AjnjlHXeeBqiZyplLsuy039dlpewJeQKKhCuSpaxhVccr9LLl6EBQBAb7qNQDTld/bocaK0bqQ0Gcq2apWiCnn3dmdhg+MCzzM0KaKIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQLOj0taB7AkSbUqwULMFiN23aTlhFelLvdx9XEdjRE=;
 b=LwCOIfcJU8ibbGDZWCzeV9Wtgr4R3blv4DGZtTC7GdqBbLKh5YD+pasaHpHflQR4qqxiYdh+Gp+M6CPP9sq5sMEduGljfaLZ/iDZod3e4zf63YmcbuiAAjXnKP/HDxK4tiaQ0vMefz3RQjSBFn0qhYrgMq0jcHxQCK4Z72Vw4cgR+a8eScBckFWwoZvgrkuFG3LKC2ot0tNZiMV/gVamtF1vIY387M5KU4h2CDxlfsUGGi519YCf7CCk8d+p8gpmRO9YHp7pydyFVDubozSfM7U/EEELv5W5FdUj7XYZtyfzousnFiPmKBKZGYPv+HlA8u72eq8gVaJ1YcyzpQGNUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3070.namprd12.prod.outlook.com (20.178.240.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.18; Fri, 27 Sep 2019 04:08:15 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.017; Fri, 27 Sep 2019
 04:08:15 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Liu, Aaron" <Aaron.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] Revert "drm/amdgpu: disable stutter mode for renoir"
Thread-Topic: [PATCH] Revert "drm/amdgpu: disable stutter mode for renoir"
Thread-Index: AQHVdOLtGEQQTtfo5kS5Hnvr8isGpqc+6CWw
Date: Fri, 27 Sep 2019 04:08:14 +0000
Message-ID: <MN2PR12MB3309243071BBF885CB5E7AFAEC810@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1569554593-18302-1-git-send-email-aaron.liu@amd.com>
In-Reply-To: <1569554593-18302-1-git-send-email-aaron.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35f9bd0e-f903-4811-eb6a-08d7430051f2
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3070:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3070285E186F74A054D8B3F0EC810@MN2PR12MB3070.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:178;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(13464003)(199004)(189003)(86362001)(6436002)(229853002)(33656002)(76116006)(74316002)(7696005)(305945005)(7736002)(55016002)(64756008)(66446008)(66556008)(6246003)(26005)(66946007)(66476007)(446003)(110136005)(486006)(476003)(99286004)(316002)(11346002)(6506007)(102836004)(53546011)(186003)(76176011)(2501003)(6116002)(3846002)(25786009)(14454004)(5660300002)(9686003)(52536014)(2906002)(478600001)(8936002)(256004)(81166006)(81156014)(66066001)(8676002)(71190400001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3070;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cb07/EgGqNiRTqxMlj6TkI/RzL+fDjBfewasdSv3+uzRz0n2rMeldBMbUwfHEkomrati9ZUIJ2twlj9dvsRbsSk0HQBIZYC/iffjAmqq22EKQTobVisKJaKn/B7ZjGZ0ph5bSMKdC75Fwf+lFTx8zNh14OBD39CN81quirUzwzgCG8jKkyxt1oojtl5tSvs067IsoeDxni8X0x6B8V6Bvm2hPpAkt4q3e1jz0KKv+Ews4Ch5xNTPn/eGq/CltQJ9unTo7esKc2eYA2sZOUFQ5sZeYljjmPjy+6n1ONBh6jUQiEPixVtCXzW5wzDPjDzUd2lv56hBJEUSaZeMHP5sY2RjJJZ9YlC4yIY0QGsEBhtq1WKZTFvmg9v3TtoCFGnQTwGdX0bHQ6wmOD+Z3v3MyrqOzHeQRRs0CTq7NtV88uo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f9bd0e-f903-4811-eb6a-08d7430051f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 04:08:14.8530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5DUJcw5Cpdc2RFHs9hgmMr+BFqL2/+l9JJLy+jc/NeSaZW4/PnN9y6wYPVpBLEH3TdhhrxRu3aBHerYNWjuBbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3070
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQLOj0taB7AkSbUqwULMFiN23aTlhFelLvdx9XEdjRE=;
 b=XuJ+HpqQOw7f+xrdrqk3URVHVju/EL5nK7n32Pcn9Oy9H9mwnTvm9y4pkqS8GgERR8qDu9H30xtMVwkbRgaAwkXuypscD7fA1jm3IwJQcuOFgJfiutH9jme5arR+6XBxl4sd8oXqHIUb8SHzlZDXZ/9ctx16OoZLLwSVJE4g5yw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IExpdSwgQWFyb24gPEFhcm9uLkxp
dUBhbWQuY29tPgo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDI3LCAyMDE5IDExOjIzIEFNCj4g
VG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5I
dWFuZ0BhbWQuY29tPjsgTGl1LCBBYXJvbiA8QWFyb24uTGl1QGFtZC5jb20+Cj4gU3ViamVjdDog
W1BBVENIXSBSZXZlcnQgImRybS9hbWRncHU6IGRpc2FibGUgc3R1dHRlciBtb2RlIGZvciByZW5v
aXIiCj4gCj4gVGhpcyByZXZlcnRzIGNvbW1pdCBjNTEyZTZmZGZkMmRhOTE3YjViNjc5MjkwMmU3
MjI0ZjU4YTc3Zjk0Lgo+IAo+IFNpbmNlIFNCSU9TIFdDRDk5MjVOLCBOTUkgcHJpbnRpbmcgZGlz
YXBwZWFyZWQuIEhlbmNlIGVuYWJsZSBzdHV0dGVyCj4gbW9kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBYXJvbiBMaXUgPGFhcm9uLmxpdUBhbWQuY29tPgoKVHJ5IHRvIGRvIG1vcmUgdGVzdHMgd2l0
aCB0aGlzIFNCSU9TIGFuZCBtYWtlIHN1cmUgdGhlIHJlc3VsdC4gQWZ0ZXIgdGhhdCwgcGF0Y2gg
aXMKUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+Cgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMiAtLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IGluZGV4IGJkYWIzZjcu
LjlkOGQ3ZTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMKPiBAQCAtMjQ2Niw4ICsyNDY2LDYgQEAgc3RhdGljIGludCBhbWRn
cHVfZG1faW5pdGlhbGl6ZV9kcm1fZGV2aWNlKHN0cnVjdAo+IGFtZGdwdV9kZXZpY2UgKmFkZXYp
Cj4gCj4gIAlpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfQ0FSUklaTyAmJiBhZGV2LT5hc2lj
X3R5cGUgIT0KPiBDSElQX1NUT05FWSkKPiAgCQlkbS0+ZGMtPmRlYnVnLmRpc2FibGVfc3R1dHRl
ciA9Cj4gYW1kZ3B1X3BwX2ZlYXR1cmVfbWFzayAmIFBQX1NUVVRURVJfTU9ERSA/IGZhbHNlIDog
dHJ1ZTsKPiAtCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SRU5PSVIpCj4gLQkJZG0tPmRj
LT5kZWJ1Zy5kaXNhYmxlX3N0dXR0ZXIgPSB0cnVlOwo+IAo+ICAJcmV0dXJuIDA7Cj4gIGZhaWw6
Cj4gLS0KPiAyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
