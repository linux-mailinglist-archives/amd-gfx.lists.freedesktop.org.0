Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8B9DCF0D
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 21:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C066F6EBCB;
	Fri, 18 Oct 2019 19:08:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820053.outbound.protection.outlook.com [40.107.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D866EBCB
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 19:08:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGQfvJXM+JBCcwVc+gGI4CZeNqKylJnvSX+e2LHULTpIN1lvnuGbUjlcu++nU1Kz3gLeQAIvuIH1+ZmgMbYcDwWKDdIHfqWtIyNkgiygrmYXQL1VAagLQ6lG1vpKnRQP6g7HdVNZCBhAiTGHrFJSWAIJIRrVVIPbGJ6BNjEPyi6i+kNmtX5sAmwCN5GUO6poP6ylLTFBhrIGUvbheJaIF/1PtAmjVvXYtiOsmiU731VmTPsFisS4/K0n/NbFJEorM8iIHDV6wQPFIm5VH6KvFQ/8JZ9BHreXthUb6Sx98fFxKD7dRe1X4olt5WOsiZOxF7GCQaOY2ZUEL4OCohmI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enxa/qzKwhDfEPLeKEDgF9lQpDI5F7l6fQh126K9tl4=;
 b=MxeWRnv7J9WuhuBwtucOxidONPxD8N2MC6oXIOF5Wd59bYnvRN5Av5grnbd21b1eR85ldHCR+YZhmcbNm/Yo//djnGpIzXGl16+aRWHS//+bfOH76B3ROozZUp5vNIX5EysJvckm2HQYOMD4Ff18k4l6OhBgiR203XUrAM8c52hadcGpHEBnXfzyQ9EtEgrfm62KRE1RmSh/qVtoL3F/KuymDmTA/M2UhvMQj+EwZKJQ3+fd+kynUY8yfFlDDGNEeGySP5WtAwXwwILFSRG3kWWlpOUqgR5c0l91cd6D+2x6pkVHo9+gSnm/hSftvOyJPSIc3sLedB7MiedavVHZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Fri, 18 Oct 2019 19:08:21 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034%4]) with mapi id 15.20.2367.019; Fri, 18 Oct 2019
 19:08:21 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Yang,
 Philip" <Philip.Yang@amd.com>
Subject: Re: [PATCH v2] drm/amdkfd: kfd open return failed if device is locked
Thread-Topic: [PATCH v2] drm/amdkfd: kfd open return failed if device is locked
Thread-Index: AQHVhdqRBjWwBKIu5kCdDNOtcOl226dgwxiA
Date: Fri, 18 Oct 2019 19:08:21 +0000
Message-ID: <b669ac97-7389-caec-70e7-40f1ab5429e3@amd.com>
References: <20191018173614.9758-1-Philip.Yang@amd.com>
In-Reply-To: <20191018173614.9758-1-Philip.Yang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YTOPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::18) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fca38e7-9f55-4494-bdaa-08d753fe8ab2
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3515:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB351575B23BAAF81FAE5E580A926C0@DM6PR12MB3515.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(199004)(189003)(43544003)(256004)(14454004)(36756003)(65956001)(66066001)(81166006)(81156014)(14444005)(65806001)(86362001)(31696002)(6116002)(6512007)(31686004)(4001150100001)(3846002)(2906002)(6436002)(486006)(476003)(2616005)(8676002)(53546011)(11346002)(99286004)(478600001)(6506007)(386003)(102836004)(52116002)(76176011)(2501003)(66446008)(64756008)(66946007)(446003)(66476007)(66556008)(25786009)(229853002)(8936002)(316002)(58126008)(71200400001)(71190400001)(110136005)(186003)(26005)(6486002)(305945005)(5660300002)(7736002)(6246003)(6636002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3515;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jyp47Ra+9GHWm9UrZohJUEFqx7910h1bFrOOsGmwXDOp4iLmIp0PCLGKxnRdPD7GEkqrSG7i2Az7VBSNEOdcHy0CBukOrJ0+rbe+kI+nXv4kBRgUzj6F6UIBJqT33lqHxPyyoLDAM3rVMRSli8asSXSyjhj1oLWBZaAFwk45ludoeUTOloMCr7izy/hqwz+rjPfyNC8UOP/4t1LEcXDZb+Lug9B/xkc6odt/z+uwMJr4A/XKHKQUZlqmtSf5oBevnenO4dhQwyMluEKPdGFAXTexmKU7ineYrDwTZTvSpCEUAksArxWiIjj+qwEDoBV+CxfKJBKH7fb5ay0+98vIRKMLzoiQwDEi7hS/hpxa3whV3RyAwZH0WglIM0veilcTm5hOr8e0nmbOYOwXb5vXhNpV6TXGRTYitpMCJU3oryI=
Content-ID: <D165E23463F89549B9867E54BD0118DC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fca38e7-9f55-4494-bdaa-08d753fe8ab2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 19:08:21.3431 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8FrHYDTa/9g6DJfKP7IffX/qSbs4bgsSTbmuHUDVFVV9DEEwHi65IOdehs7wrmRpeTDLymhB/mWrfh73YF+F3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3515
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enxa/qzKwhDfEPLeKEDgF9lQpDI5F7l6fQh126K9tl4=;
 b=ktvy1QjKDh3AFKpClxNnP0G/ihAIiV8Ak6XeawcJuUyk2x4MgmfNMSyqRDc4K5xPysNekWs8anPyrfkEz4MU3bm4djpK6VoCPq58uA1qeow9wo0CR28uqJ6+KBnoq4YqXRlfc/pWLREf5XUAgwZnao9qnLJPyKYL6Tdlghk/Sug=
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

T24gMjAxOS0xMC0xOCAxOjM2IHAubS4sIFlhbmcsIFBoaWxpcCB3cm90ZToNCj4gSWYgZGV2aWNl
IGlzIGxvY2tlZCBmb3Igc3VzcGVuZCBhbmQgcmVzdW1lLCBrZmQgb3BlbiBzaG91bGQgcmV0dXJu
DQo+IGZhaWxlZCAtRUFHQUlOIHdpdGhvdXQgY3JlYXRpbmcgcHJvY2Vzcywgb3RoZXJ3aXNlIHRo
ZSBhcHBsaWNhdGlvbiBleGl0DQo+IHRvIHJlbGVhc2UgdGhlIHByb2Nlc3Mgd2lsbCBoYW5nIHRv
IHdhaXQgZm9yIHJlc3VtZSBpcyBkb25lIGlmIHRoZSBzdXNwZW5kDQo+IGFuZCByZXN1bWUgaXMg
c3R1Y2sgc29tZXdoZXJlLiBUaGlzIGlzIGJhY2t0cmFjZToNCj4NCj4gdjI6IGZpeCBwcm9jZXNz
ZXMgdGhhdCB3ZXJlIGNyZWF0ZWQgYmVmb3JlIHN1c3BlbmQvcmVzdW1lIGdvdCBzdHVjaw0KPg0K
PiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSBJTkZPOiB0YXNrIHJvY21pbmZvOjMwMjQgYmxv
Y2tlZCBmb3IgbW9yZQ0KPiB0aGFuIDEyMCBzZWNvbmRzLg0KPiBbVGh1IE9jdCAxNyAxNjo0Mzoz
NyAyMDE5XSAgICAgICBOb3QgdGFpbnRlZA0KPiA1LjAuMC1yYzEta2ZkLWNvbXB1dGUtcm9jbS1k
a21zLW5vLW5waS0xMTMxICMxDQo+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICJlY2hvIDAg
Pg0KPiAvcHJvYy9zeXMva2VybmVsL2h1bmdfdGFza190aW1lb3V0X3NlY3MiIGRpc2FibGVzIHRo
aXMgbWVzc2FnZS4NCj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gcm9jbWluZm8gICAgICAg
IEQgICAgMCAgMzAyNCAgIDI5NDcNCj4gMHg4MDAwMDAwMA0KPiBbVGh1IE9jdCAxNyAxNjo0Mzoz
NyAyMDE5XSBDYWxsIFRyYWNlOg0KPiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgPyBfX3Nj
aGVkdWxlKzB4M2Q5LzB4OGEwDQo+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBzY2hlZHVs
ZSsweDMyLzB4NzANCj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIHNjaGVkdWxlX3ByZWVt
cHRfZGlzYWJsZWQrMHhhLzB4MTANCj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIF9fbXV0
ZXhfbG9jay5pc3JhLjkrMHgxZTMvMHg0ZTANCj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0g
ID8gX19jYWxsX3NyY3UrMHgyNjQvMHgzYjANCj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0g
ID8gcHJvY2Vzc190ZXJtaW5hdGlvbl9jcHNjaCsweDI0LzB4MmYwDQo+IFthbWRncHVdDQo+IFtU
aHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBwcm9jZXNzX3Rlcm1pbmF0aW9uX2Nwc2NoKzB4MjQv
MHgyZjANCj4gW2FtZGdwdV0NCj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0NCj4ga2ZkX3By
b2Nlc3NfZGVxdWV1ZV9mcm9tX2FsbF9kZXZpY2VzKzB4NDIvMHg2MCBbYW1kZ3B1XQ0KPiBbVGh1
IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAga2ZkX3Byb2Nlc3Nfbm90aWZpZXJfcmVsZWFzZSsweDFi
ZS8weDIyMA0KPiBbYW1kZ3B1XQ0KPiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgX19tbXVf
bm90aWZpZXJfcmVsZWFzZSsweDNlLzB4YzANCj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0g
IGV4aXRfbW1hcCsweDE2MC8weDFhMA0KPiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgPyBf
X2hhbmRsZV9tbV9mYXVsdCsweGJhMy8weDEyMDANCj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAx
OV0gID8gZXhpdF9yb2J1c3RfbGlzdCsweDVhLzB4MTEwDQo+IFtUaHUgT2N0IDE3IDE2OjQzOjM3
IDIwMTldICBtbXB1dCsweDRhLzB4MTIwDQo+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBk
b19leGl0KzB4Mjg0LzB4YjIwDQo+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICA/IGhhbmRs
ZV9tbV9mYXVsdCsweGZhLzB4MjAwDQo+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBkb19n
cm91cF9leGl0KzB4M2EvMHhhMA0KPiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgX194NjRf
c3lzX2V4aXRfZ3JvdXArMHgxNC8weDIwDQo+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBk
b19zeXNjYWxsXzY0KzB4NGYvMHgxMDANCj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIGVu
dHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkNCj4NCj4gU2lnbmVkLW9mZi1i
eTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgICAgICAgICAgICAgICB8IDYgKysrLS0t
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdl
ci5jIHwgNiArKysrKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9jaGFyZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5j
DQo+IGluZGV4IGQ5ZTM2ZGJmMTNkNS4uNDBkNzVjMzlmMDhlIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCj4gQEAgLTEyMCwxMyArMTIwLDEzIEBAIHN0
YXRpYyBpbnQga2ZkX29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGVw
KQ0KPiAgIAkJcmV0dXJuIC1FUEVSTTsNCj4gICAJfQ0KPiAgIA0KPiArCWlmIChrZmRfaXNfbG9j
a2VkKCkpDQo+ICsJCXJldHVybiAtRUFHQUlOOw0KPiArDQo+ICAgCXByb2Nlc3MgPSBrZmRfY3Jl
YXRlX3Byb2Nlc3MoZmlsZXApOw0KPiAgIAlpZiAoSVNfRVJSKHByb2Nlc3MpKQ0KPiAgIAkJcmV0
dXJuIFBUUl9FUlIocHJvY2Vzcyk7DQo+ICAgDQo+IC0JaWYgKGtmZF9pc19sb2NrZWQoKSkNCj4g
LQkJcmV0dXJuIC1FQUdBSU47DQo+IC0NCj4gICAJZGV2X2RiZyhrZmRfZGV2aWNlLCAicHJvY2Vz
cyAlZCBvcGVuZWQsIGNvbXBhdCBtb2RlICgzMiBiaXQpIC0gJWRcbiIsDQo+ICAgCQlwcm9jZXNz
LT5wYXNpZCwgcHJvY2Vzcy0+aXNfMzJiaXRfdXNlcl9tb2RlKTsNCj4gICANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIu
Yw0KPiBpbmRleCA4NTA5ODE0YTZmZjAuLjM3ODQwMTNiOTJhMCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIu
Yw0KPiBAQCAtMTI4LDYgKzEyOCwxMiBAQCB2b2lkIGtmZF9wcm9jZXNzX2RlcXVldWVfZnJvbV9h
bGxfZGV2aWNlcyhzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnApDQo+ICAgew0KPiAgIAlzdHJ1Y3Qga2Zk
X3Byb2Nlc3NfZGV2aWNlICpwZGQ7DQo+ICAgDQo+ICsJLyogSWYgc3VzcGVuZC9yZXN1bWUgZ290
IHN0dWNrLCBkcW1fbG9jayBpcyBob2xkLA0KPiArCSAqIHNraXAgcHJvY2Vzc190ZXJtaW5hdGlv
bl9jcHNjaCB0byBhdm9pZCBkZWFkbG9jaw0KPiArCSAqLw0KPiArCWlmIChrZmRfaXNfbG9ja2Vk
KCkpDQo+ICsJCXJldHVybjsNCj4gKw0KDQpIb2xkaW5nIHRoZSBEUU0gbG9jayBkdXJpbmcgcmVz
ZXQgaGFzIGNhdXNlZCBvdGhlciBwcm9ibGVtcyAobG9jayANCmRlcGVuZGVuY3kgaXNzdWVzIGFu
ZCBkZWFkbG9ja3MpIGFuZCBJIHdhcyB0aGlua2luZyBhYm91dCBnZXR0aW5nIHJpZCBvZiANCnRo
YXQgY29tcGxldGVseS4gVGhlIGludGVudGlvbiBvZiBob2xkaW5nIHRoZSBEUU0gbG9jayBkdXJp
bmcgcmVzZXQgd2FzIA0KdG8gcHJldmVudCB0aGUgZGV2aWNlIHF1ZXVlIG1hbmFnZXIgZnJvbSBh
Y2Nlc3NpbmcgdGhlIENQIGhhcmR3YXJlIHdoaWxlIA0KYSByZXNldCB3YXMgaW4gcHJvZ3Jlc3Mu
IEhvd2V2ZXIsIEkgdGhpbmsgdGhlcmUgYXJlIHNtYXJ0ZXIgd2F5cyB0byANCmFjaGlldmUgdGhh
dC4gV2UgYWxyZWFkeSBnZXQgYSBwcmUtcmVzZXQgY2FsbGJhY2sgKGtnZDJrZmRfcHJlX3Jlc2V0
KSANCnRoYXQgZXhlY3V0ZXMgdGhlIGtnZDJrZmRfc3VzcGVuZCwgd2hpY2ggc3VzcGVuZHMgcHJv
Y2Vzc2VzIGFuZCBzdG9wcyANCkRRTSB0aHJvdWdoIGtmZC0+ZHFtLT5vcHMuc3RvcChrZmQtPmRx
bSkuIFRoaXMgc2hvdWxkIHRha2UgY2FyZSBvZiBtb3N0IA0Kb2YgdGhlIHByb2JsZW0uIElmIHRo
ZXJlIGFyZSBhbnkgcGxhY2VzIGluIERRTSB0aGF0IHRyeSB0byBhY2Nlc3MgdGhlIA0KZGV2aWNl
cywgdGhleSBzaG91bGQgYWRkIGNvbmRpdGlvbnMgdG8gbm90IGFjY2VzcyBIVyB3aGlsZSBEUU0g
aXMgDQpzdG9wcGVkLiBUaGVuIHdlIGNvdWxkIGF2b2lkIGhvbGRpbmcgYSBsb2NrIGluZGVmaW5p
dGVseSB3aGlsZSBhIHJlc2V0IA0KaXMgaW4gcHJvZ3Jlc3MuDQoNClRoZSBEUU0gbG9jayBpcyBw
YXJ0aWN1bGFybHkgcHJvYmxlbWF0aWMgaW4gdGVybXMgb2YgbG9jayBkZXBlbmRlbmNpZXMgDQpi
ZWNhdXNlIGl0IGNhbiBiZSB0YWtlbiBpbiBNTVUgbm90aWZpZXJzLiBXZSB3YW50IHRvIGF2b2lk
IHRha2luZyBhbnkgDQpvdGhlciBsb2NrcyB3aGlsZSBob2xkaW5nIHRoZSBEUU0gbG9jay4gSG9s
ZGluZyB0aGUgRFFNIGxvY2sgZm9yIGEgbG9uZyANCnRpbWUgZHVyaW5nIHJlc2V0IGlzIGNvdW50
ZXJwcm9kdWN0aXZlIHRvIHRoYXQgb2JqZWN0aXZlLg0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoN
Cg0KPiAgIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KHBkZCwgJnAtPnBlcl9kZXZpY2VfZGF0YSwgcGVy
X2RldmljZV9saXN0KQ0KPiAgIAkJa2ZkX3Byb2Nlc3NfZGVxdWV1ZV9mcm9tX2RldmljZShwZGQp
Ow0KPiAgIH0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
