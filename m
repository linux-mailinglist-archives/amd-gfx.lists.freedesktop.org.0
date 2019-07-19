Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E5E6E17B
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 09:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B54D6E591;
	Fri, 19 Jul 2019 07:12:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720073.outbound.protection.outlook.com [40.107.72.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42156E591
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 07:12:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYjmfqWTepIs7rWBlxMvSyCBhcD2dw+WfQi5/Ujr0QVtZ4irR0tI6BxkA5hJeIDjdP78sN8aD5OoqXZpEtEhkMBKF1wGk09f7/9GEQvUrfwY3xY9AgIHGr1pG8wxSsfaXD3tuJTw8wqon0CMN1Ujx4sOL7Wk4oyulws8QaFX9zy1ULekkBO5i0DIeI/lvMOEwiE1Qyrq8y8RwuPARtnf6IKfCfIBoZGkGkJoggvw8eaLqz2LZMLxiG14vTGzYI8DOARiJEGvyWEC6L28Km/OeMhqM3zetDac0KdlivHizdmq13ey07520chL4CyxBHtD6KQd76BeOwgm03eO/bjzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O99+FeIbeVWQFepA9d3/Ic9LOZqX4SHrTN8vo0CuFOg=;
 b=KhLQ4MZ7KW/0vSoxr6YZsblR0VCegn2AXSF00u0kmX53nSN292QMqsIEZYdFMxEHkgIKBdgjt0wOhbk9A+hG5ZhMSWzOh8paDWrLPOARs9Ma8ULDqf48g2A6/VsUfzuJJvVQKWAlBfsPtCpVjho/km4On/20WhJ/FzrIE4+2GVF/LFyusTkPVJOfNq3cRjc8ug+lxIleIz0YFl9e9CxeIWZw1WclkIEJ8Fqpo3hmAYqAXGIqwqrUhD1wGZoOsmwvZpTX9BKyva1YMNx7IX8ipnNyES9vSZxRxSmE8lT2x6DZBJOsxznHiv6ujMxjn5e44Mv8hMvz/x+mXyEVnWuLjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Fri, 19 Jul 2019 07:12:51 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.011; Fri, 19 Jul
 2019 07:12:51 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
Subject: Re: [PATCH] drm/amdgpu: fix two documentation mismatch issues
Thread-Topic: [PATCH] drm/amdgpu: fix two documentation mismatch issues
Thread-Index: AQHVPdAv9Uv1aveFGkKpifW5vvBnTKbRhxMA
Date: Fri, 19 Jul 2019 07:12:51 +0000
Message-ID: <ddf5def1-2320-c49a-4278-888ea03e7ef4@amd.com>
References: <20190719011943.10920-1-xywang.sjtu@sjtu.edu.cn>
In-Reply-To: <20190719011943.10920-1-xywang.sjtu@sjtu.edu.cn>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR10CA0025.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::38) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a3f4bf6-5417-4b07-681a-08d70c1882d8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1546; 
x-ms-traffictypediagnostic: DM5PR12MB1546:
x-microsoft-antispam-prvs: <DM5PR12MB15464892FC680B60EC23F07C83CB0@DM5PR12MB1546.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:478;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(189003)(199004)(36756003)(66476007)(64756008)(66446008)(46003)(86362001)(66946007)(476003)(66556008)(2616005)(446003)(11346002)(65806001)(6246003)(65956001)(5660300002)(71190400001)(71200400001)(2171002)(65826007)(6436002)(186003)(6916009)(6512007)(478600001)(64126003)(305945005)(7736002)(53936002)(6486002)(68736007)(2906002)(81156014)(31686004)(99286004)(8936002)(6116002)(81166006)(256004)(54906003)(486006)(58126008)(102836004)(229853002)(4326008)(52116002)(386003)(76176011)(6506007)(25786009)(8676002)(316002)(14454004)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1546;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /PLfD3aMi/PzEyyp7molW7sWVHvCSFizfRK6Px3NqDBwXzTDJG4aMNATRw+zJAFfj54gso4b/RU9cZedqF5+CQqcQ3RLQ1Sh3rrKeXh33vvFrVlpzgDhBaEnLdesGz/j6VFLF9VyHBB063UECijxime5RQr/Ui8KEV+Iaad75U4hwE7pLBtZc437T3c6ZV/lqywQrdATFRoTHpvRG2Y878yjD1PeyxfAwOxSYwXsoc/g1Y/Co5xhEKfbx+zoLNiT+z3tMxVLbb0pjwIHO9T1RGYpmhiWTRTjBVGR03eDNH63TdNEjldA1K9H0m0u7pVhS03xybB6sroAl48GtYRCH57E7nowQimWU60fGzJYam7/BPAcoJsfZtWNC4UNpPyIx5uENKbenfDsnholHf5TMaNdboXv4AyrV19mGQlqGSY=
Content-ID: <D128334A10EA2E4498FB89A30BBFF9E2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3f4bf6-5417-4b07-681a-08d70c1882d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 07:12:51.3165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1546
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O99+FeIbeVWQFepA9d3/Ic9LOZqX4SHrTN8vo0CuFOg=;
 b=m3qHYIJAMCJWfzAI122hIys8Dn/9sMf4R16vctGZEmtEex1dWsVN170G8uJmDX0C7zpsZmVxGaTyuEH1lVkenKRTu83zxrOCglXO+DXUdVoDfFgMAiwKq3TQ7eiBcJICQ2lSr5d9Yoc9aW0HTOUZfvbJYSD50XmPrWLznDoBhm8=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhou,
 David\(ChunMing\)" <David1.Zhou@amd.com>,
 "trivial@kernel.org" <trivial@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTkuMDcuMTkgdW0gMDM6MTkgc2NocmllYiBXYW5nIFhpYXlhbmc6DQo+IFRoZSBmdW5jdGlv
biBuYW1lIG1lbnRpb25lZCBpbiB0aGUgZG9jdW1lbnRhdGlvbmFsIGNvbW1lbnRzIG1pc21hdGNo
ZXMNCj4gdGhlIGFjdHVhbCBvbmUuIFRoZSBtaXNtYXRjaCBtYXkgbWFrZSB0cm91YmxlIGZvciBh
dXRvbWF0aWMgZG9jdW1lbnRhdGlvbg0KPiBnZW5lcmF0aW9uLiBPbmUgb2YgdGhlIGVycm9ub3Vz
IG5hbWUgaGFzIHNlZW4gdG8gYmUgbWlzdXNlZA0KPiBhbmQgZml4ZWQgaW4gY29tbWl0IGJjNWFi
MmQyOWI4YSAoImRybS9hbWRncHU6IGZpeCB0eXBvIGluIGZ1bmN0aW9uDQo+IHNkbWFfdjRfMF9w
YWdlX3Jlc3VtZSIpLg0KPg0KPiBUaGVyZSBpcyBhcHBhcmVudGx5IG5vIGZ1bmN0aW9uYWwgY2hh
bmdlIGluIHRoZSBwYXRjaC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogV2FuZyBYaWF5YW5nIDx4eXdh
bmcuc2p0dUBzanR1LmVkdS5jbj4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zZG1hX3Y0XzAuYyB8IDQgKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nk
bWFfdjRfMC5jDQo+IGluZGV4IDQ0MjgwMTg2NzJkMy4uMzc0ODA3NDIyMGJiIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0KPiBAQCAtNDU1LDcgKzQ1NSw3IEBA
IHN0YXRpYyB1aW50NjRfdCBzZG1hX3Y0XzBfcGFnZV9yaW5nX2dldF93cHRyKHN0cnVjdCBhbWRn
cHVfcmluZyAqcmluZykNCj4gICB9DQo+ICAgDQo+ICAgLyoqDQo+IC0gKiBzZG1hX3Y0XzBfcmlu
Z19zZXRfd3B0ciAtIGNvbW1pdCB0aGUgd3JpdGUgcG9pbnRlcg0KPiArICogc2RtYV92NF8wX3Bh
Z2VfcmluZ19zZXRfd3B0ciAtIGNvbW1pdCB0aGUgd3JpdGUgcG9pbnRlcg0KPiAgICAqDQo+ICAg
ICogQHJpbmc6IGFtZGdwdSByaW5nIHBvaW50ZXINCj4gICAgKg0KPiBAQCAtNjg4LDcgKzY4OCw3
IEBAIHN0YXRpYyB2b2lkIHNkbWFfdjRfMF9wYWdlX3N0b3Aoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpDQo+ICAgfQ0KPiAgIA0KPiAgIC8qKg0KPiAtICogc2RtYV92XzBfY3R4X3N3aXRjaF9l
bmFibGUgLSBzdG9wIHRoZSBhc3luYyBkbWEgZW5naW5lcyBjb250ZXh0IHN3aXRjaA0KPiArICog
c2RtYV92NF8wX2N0eF9zd2l0Y2hfZW5hYmxlIC0gc3RvcCB0aGUgYXN5bmMgZG1hIGVuZ2luZXMg
Y29udGV4dCBzd2l0Y2gNCj4gICAgKg0KPiAgICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50
ZXINCj4gICAgKiBAZW5hYmxlOiBlbmFibGUvZGlzYWJsZSB0aGUgRE1BIE1FcyBjb250ZXh0IHN3
aXRjaC4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
