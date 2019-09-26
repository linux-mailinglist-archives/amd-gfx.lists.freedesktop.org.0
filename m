Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54790BF452
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 15:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF586ED33;
	Thu, 26 Sep 2019 13:47:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800043.outbound.protection.outlook.com [40.107.80.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5436ED33
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 13:47:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUiq0o4mxJv5b4j4oxjwYRZkdRYiF0i6acMSQr5zCZDHCxGcsQKVt27XFEdP9O1soRdIj4ylkpglMuwoQ1vZLGIwir3QoB1hZvf+VY2Y4tEGPHZCSRQJa5xm6YOMyBk9vY/lfSPzzB0S0jPVtqkXhXl92HR4S1nW2u6JLV9rbdztDeg54YB8bKPww7WAJwp5UM47sJpcMCoKkDV5murgIwb3v2XVsdGdk3b/237MWc9sFbJNibWZfoao1ViZJiLVzUye/oPF16OJHJTX433Q39V/DQPK/dH6N+8rUyq398lXY6pWj1bltZqEXXaoZjal8DRo/JQc+IhljHyzWjstsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cayqk6SW2ZDlSUb+qr4RfM/ciLWDLPD9zPHmfBHYMWg=;
 b=HR3r6PiRgw29TyXIEAksChpQL/RvQoY8IZLhJaXJtuT0ZUsTCNuey4oFfKSiI4xpgWre++smAqa3GhvA4IEhgDAfMBL4p1D3KmpRPwoJ5vcVo8M3VFBoHkd8uqsNxmIzwUjpY93Uva8avtbNb2CzSmVov3P3lxdsubTa3ZpMLZm5yd6qZbdzcOPVi8z1+Ttd30ZjNHi2QaUacQK/yceIjJIB/+3Fz418o3oAlHmKFgOYbOVi1SxYugSRrWjROdc3sbQIXIIDo+bizCnXXwbBGUVhqUwspX9iQHKn9geuM/Cosgbg6tKPA00CHVm6Q/gcOqKhD5hoTtXebg5NoehkiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2342.namprd12.prod.outlook.com (52.132.208.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 26 Sep 2019 13:47:01 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 13:47:01 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Topic: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Index: AQHVdHAGrTBNCtT05E6b13uIS9I6Rqc9+NeA
Date: Thu, 26 Sep 2019 13:47:00 +0000
Message-ID: <1d7c307f-29c5-9286-636e-b06fa44ef9ae@amd.com>
References: <20190926080746.20765-1-xiaojie.yuan@amd.com>
 <BN8PR12MB36027CA5662543E7F956657589860@BN8PR12MB3602.namprd12.prod.outlook.com>
 <BN6PR12MB1809591CB4102B70BEC82E93F7860@BN6PR12MB1809.namprd12.prod.outlook.com>
 <608f4e8a-ef35-6fbc-cda6-51c3803af014@gmail.com>
 <CADnq5_PdWnfB1knhdi_fre1gSeE5ibMXvCrzq-id36BbR63ZfQ@mail.gmail.com>
In-Reply-To: <CADnq5_PdWnfB1knhdi_fre1gSeE5ibMXvCrzq-id36BbR63ZfQ@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0009.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::21)
 To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e87b9de4-43dc-4bb0-d248-08d742880195
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB2342:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2342A823A4912B2E5E5B473583860@DM5PR12MB2342.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(189003)(199004)(478600001)(6436002)(486006)(2616005)(7736002)(305945005)(65806001)(65956001)(6512007)(6306002)(2906002)(14454004)(6246003)(11346002)(58126008)(966005)(54906003)(476003)(4326008)(71190400001)(71200400001)(6116002)(25786009)(316002)(46003)(6486002)(229853002)(36756003)(102836004)(386003)(6506007)(53546011)(52116002)(256004)(76176011)(14444005)(1411001)(5660300002)(86362001)(99286004)(446003)(66574012)(8936002)(81166006)(186003)(31696002)(6916009)(66556008)(66446008)(64756008)(66476007)(66946007)(81156014)(31686004)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2342;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UI+hJPEZQRYYJXwJ35fzgVqGmzruNL/MGnyiYrYxYgh8/1Eqzjkc4VMMQnaIgJLq6z5535Es3w583at48/gM12FkLF/P/9GBRmLpuJObhwhsd4q7RsvJvDFlbFVdlimwlGh+aw3clqdqeW+m3b6y1jxgZijBi0vM2VcYkbA2SF2TFEfG8tP8VypOF9m94ompb3piMH1vsmYN6/g7oXMkr/Jq4PCMC4fYCCaDxAdI4gqEnv+XPu6YxtNCM92ArxvIvNJMSwhhIxokyOQ6O7YDZRwbWrh4kEyTK9Jj8azUhzw53dH50ej4YWHrheB0MLR7iXAeCy87Kn77OA2kZ17+/wj04IsMOdN3hrvxIDbv2jmF+pfhzT2t/knkClgi9QSn7GvPz9GBKvfS8PlNwoEQDIv45LaTzZj9m2rE1pqzD3E3kklerWpjXdqYeA+LvdBIwSy2YOjHs64t1WXp2lmi/Q==
Content-ID: <E88644CD8FA7AA46ABE7A675BABD0E29@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87b9de4-43dc-4bb0-d248-08d742880195
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 13:47:00.8964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Vqpa8hNpsdMVdF7YHBitvgp19dTRd8hC+Fa3vlMrMcO4MaTerfhN+nmQy0sR0Qr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2342
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cayqk6SW2ZDlSUb+qr4RfM/ciLWDLPD9zPHmfBHYMWg=;
 b=uHteFq9+mOEvJVT/Znc3Yhudf9ztl7uINPT5GwTLMi+tY1/4B/81ajKatpziTnU2Lm2Y0lYzIgRTev35U4YYxsOHkN5uocdAQ0rx1yFLm5p69ytCM6IsQ/1bLYV2tCLhD1kDBxSJ+NIova3NlCPKVj0eDff9oYswSnPYwV8HZ9A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjYuMDkuMTkgdW0gMTU6NDAgc2NocmllYiBBbGV4IERldWNoZXI6DQo+IE9uIFRodSwgU2Vw
IDI2LCAyMDE5IGF0IDg6MjkgQU0gQ2hyaXN0aWFuIEvDtm5pZw0KPiA8Y2tvZW5pZy5sZWljaHR6
dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOg0KPj4gU3RvcCwgd2FpdCBhIHNlY29uZCBndXlzIQ0K
Pj4NCj4+IFRoaXMgd2lsbCBkaXNhYmxlIHRoZSB3b3JrYXJvdW5kIGZvciBOYXZpMTAgYW5kIHRo
YXQgaXMgY2VydGFpbmx5IG5vdCBjb3JyZWN0Og0KPj4NCj4+ICEoYWRldi0+YXNpY190eXBlID49
IENISVBfTkFWSTEwICYmIGFkZXYtPmFzaWNfdHlwZSA8PSBDSElQX05BVkkxMikNCj4+DQo+IEFj
dHVhbGx5LCBJIHRoaW5rIGl0J3MgY29ycmVjdC4gV2hlbiBJIG1lcmdlZCB0aGUgYmFjbyBwYXRj
aCwgSQ0KPiBhY2NpZGVudGFsbHkgZHJvcHBlZCB0aGUgbmF2aSBjaGVja3MuICBFLmcuLA0KPiBA
QCAtMjQ1LDggKzI0NSw5IEBAIHN0YXRpYyB2b2lkIGdtY192MTBfMF9mbHVzaF9ncHVfdGxiKHN0
cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgICAgICAgICBtdXRleF9sb2NrKCZhZGV2
LT5tbWFuLmd0dF93aW5kb3dfbG9jayk7DQo+DQo+ICAgICAgICAgIGdtY192MTBfMF9mbHVzaF92
bV9odWIoYWRldiwgdm1pZCwgQU1ER1BVX01NSFVCLCAwKTsNCj4gLSAgICAgICBpZiAoIWFkZXYt
Pm1tYW4uYnVmZmVyX2Z1bmNzX2VuYWJsZWQgfHwgIWFkZXYtPmliX3Bvb2xfcmVhZHkgfHwNCj4g
LSAgICAgICAgICAgYWRldi0+YXNpY190eXBlICE9IENISVBfTkFWSTEwKSB7DQo+ICsgICAgICAg
aWYgKCFhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jc19lbmFibGVkIHx8DQo+ICsgICAgICAgICAgICFh
ZGV2LT5pYl9wb29sX3JlYWR5IHx8DQo+ICsgICAgICAgICAgIGFkZXYtPmluX2dwdV9yZXNldCkg
ew0KPiAgICAgICAgICAgICAgICAgIGdtY192MTBfMF9mbHVzaF92bV9odWIoYWRldiwgdm1pZCwg
QU1ER1BVX0dGWEhVQiwgMCk7DQo+ICAgICAgICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZhZGV2
LT5tbWFuLmd0dF93aW5kb3dfbG9jayk7DQo+ICAgICAgICAgICAgICAgICAgcmV0dXJuOw0KPiBJ
IHRoaW5rIGl0IHNob3VsZCBoYXZlIGJlZW4NCj4gYWRldi0+YXNpY190eXBlICE9IENISVBfTkFW
STEwICYmIGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX05BVkkxNCAmJg0KPiBhZGV2LT5hc2ljX3R5
cGUgIT0gQ0hJUF9OQVZJMTINCg0KTXkgbGFzdCBzdGF0dXMgaXMgdGhhdCBOYXZpMTIgaXMgbm90
IHN1cHBvc2VkIHRvIG5lZWQgdGhhdCB3b3JrYXJvdW5kLCANCnRoYXQncyB3aHkgd2UgY2hlY2tl
ZCBOYXZpMTAgYW5kIGxhdGVyIE5hdmkxNCBzZXBhcmF0ZWx5Lg0KDQpJdCdzIHBvc3NpYmxlIHRo
YXQgSSBtaXNzLXJlYWQgdGhlICEoYWRldi0+YXNpY190eXBlID49IENISVBfTkFWSTEwICYmIA0K
YWRldi0+YXNpY190eXBlIDw9IENISVBfTkFWSTEyKSBjaGVjayBoZXJlLCBidXQgZWl0aGVyIHdh
eSB0aGF0IGxvb2tzIHRvIA0KY29tcGxpY2F0ZWQgdG8gbWUuDQoNCldlIHNob3VsZCByYXRoZXIg
bWVudGlvbiBldmVyeSBhZmZlY3RlZCBhc2ljIHR5cGUgc2VwYXJhdGVseSBoZXJlLg0KDQpSZWdh
cmRzLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IEFsZXgNCj4NCj4+IENocmlzdGlhbi4NCj4+DQo+Pg0K
Pj4gQW0gMjYuMDkuMTkgdW0gMTQ6MjYgc2NocmllYiBEZXVjaGVyLCBBbGV4YW5kZXI6DQo+Pg0K
Pj4gUGxlYXNlIGFkZCBhIHBhdGNoIGRlc2NyaXB0aW9uLiAgV2l0aCB0aGF0IGZpeGVkOg0KPj4g
UmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBGcm9tOiBhbWQtZ2Z4IDxhbWQt
Z2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBvbiBiZWhhbGYgb2YgWXVhbiwgWGlh
b2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+DQo+PiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVy
IDI2LCAyMDE5IDQ6MDkgQU0NCj4+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+DQo+PiBDYzogYWxleGRldWNoZXJAZ21haWwu
Y29tIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+DQo+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0v
YW1kZ3B1L2dtYzEwOiBhcHBseSB0aGUgJ2ludmFsaWRhdGlvbiBmcm9tIHNkbWEnIHdvcmthcm91
bmQgZm9yIG5hdmkNCj4+DQo+PiBIaSBBbGV4LA0KPj4NCj4+IFRoaXMgcGF0Y2ggaXMgdG8gYWRk
IHRoZSBhc2ljX3R5cGUgY2hlY2sgd2hpY2ggaXMgbWlzc2luZyBhZnRlciBkcm0tbmV4dCBicmFu
Y2ggcmViYXNlLg0KPj4NCj4+IEJSLA0KPj4gWGlhb2ppZQ0KPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4+IEZyb206IFl1YW4sIFhpYW9qaWUgPFhpYW9qaWUuWXVhbkBhbWQu
Y29tPg0KPj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAyNiwgMjAxOSA0OjA4IFBNDQo+PiBU
bzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnPg0KPj4gQ2M6IGFsZXhkZXVjaGVyQGdtYWlsLmNvbSA8YWxleGRldWNoZXJAZ21haWwu
Y29tPjsgWXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+DQo+PiBTdWJqZWN0OiBb
UEFUQ0hdIGRybS9hbWRncHUvZ21jMTA6IGFwcGx5IHRoZSAnaW52YWxpZGF0aW9uIGZyb20gc2Rt
YScgd29ya2Fyb3VuZCBmb3IgbmF2aQ0KPj4NCj4+IEZpeGVzOiA3NjdhY2FiZGFjODEgKCJkcm0v
YW1kL3Bvd2VycGxheTogYWRkIGJhY28gc211IHJlc2V0IGZ1bmN0aW9uIGZvciBzbXUxMSIpDQo+
PiBTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPg0KPj4g
LS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jIHwgMSArDQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192MTBfMC5jDQo+PiBpbmRleCBjYjNmNjE4NzNiYWEuLmRjMmU2OGUwMTll
YiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5j
DQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYw0KPj4gQEAg
LTI5Miw2ICsyOTIsNyBAQCBzdGF0aWMgdm9pZCBnbWNfdjEwXzBfZmx1c2hfZ3B1X3RsYihzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgdm1pZCwNCj4+DQo+PiAgICAgICAgICAg
aWYgKCFhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jc19lbmFibGVkIHx8DQo+PiAgICAgICAgICAgICAg
ICFhZGV2LT5pYl9wb29sX3JlYWR5IHx8DQo+PiArICAgICAgICAgICAhKGFkZXYtPmFzaWNfdHlw
ZSA+PSBDSElQX05BVkkxMCAmJiBhZGV2LT5hc2ljX3R5cGUgPD0gQ0hJUF9OQVZJMTIpIHx8DQo+
PiAgICAgICAgICAgICAgIGFkZXYtPmluX2dwdV9yZXNldCkgew0KPj4gICAgICAgICAgICAgICAg
ICAgZ21jX3YxMF8wX2ZsdXNoX3ZtX2h1YihhZGV2LCB2bWlkLCBBTURHUFVfR0ZYSFVCXzAsIDAp
Ow0KPj4gICAgICAgICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZhZGV2LT5tbWFuLmd0dF93aW5k
b3dfbG9jayk7DQo+PiAtLQ0KPj4gMi4yMC4xDQo+Pg0KPj4NCj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0K
Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KPj4NCj4+DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
