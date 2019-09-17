Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E76BB45CB
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 05:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE416EACA;
	Tue, 17 Sep 2019 03:03:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690059.outbound.protection.outlook.com [40.107.69.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429D26EACA
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 03:03:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3cvfSXRZ7vVvHAfj+ompf1s6VeStcEhcI+AAaIpoYHC4ghbRe5ElZRqJmMh655t9CCqDxXY1WuA/YLJSenTmz1XOw8C7Xm430/W2lqcMSnhwuT5s2gsQBSwth4ftqXDQmQfNutn/7pvHHe65QgCsO/SRbdqsuZlwMbNWfdSBVouthFIfAVjK8Oixnn6QfLR28qO2FiUlhS61tFcefB36bzHWhWhF5Azah/qMUUXoBxeFMclX9iZBU6+fRd1i8z1giUSN6M1L2V9vLIKOH8ZJmBsOMd1Bcu+wlH0jrdnweYABFHOoT8L+9McWX4ZfJ+VlcYCDGVd1bzkD43BCJJ2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhCEwlhbjmVxQJUbSzT3ql9A4yGVNJKZv5JfS4y+MKg=;
 b=JSm2kvgpMxyYn9ylJ0u15pdRFfMLZ/aXgoAHxt3uSTAmkfMNZbujskkOF5UWxQQxt0wWvZTkn1QFk1HgCwEPviplW0QwxxC4BbCpMJqgaFCWbubDuJpGRc+O+1EL4Rz8Aa7Oi2TCH3L5eBo6ADUc1HcDloO4Q92cz4iqJp97YbXSzSyBHVVEMizXUOWc6qHnttBfqln3KdkU3YV+Jt1upuHFLen9L7cn9L1XxK4lFSo6O2Tjx7oDvHh/2xdqhXgY9bCccqsGsQ/lymAs+mt5nkP+/dz4lgTvDsckvBdSjpLFwZUlGibyRmk0UBTfgOIcQ9tg9AptQ3FveddwktDpJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1657.namprd12.prod.outlook.com (10.172.38.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Tue, 17 Sep 2019 03:02:59 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 03:02:59 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
Subject: Re: [Patch] drm/amdgpu: add navi12 pci id
Thread-Topic: [Patch] drm/amdgpu: add navi12 pci id
Thread-Index: AQHVbQLpRi6MOO44JEKZbCbq0YcMyKcvLssQ
Date: Tue, 17 Sep 2019 03:02:58 +0000
Message-ID: <21ED1B7F-2E7C-483B-B1DC-690A862F5908@amd.com>
References: <DM5PR12MB253567599A33CBC49F0DFEDD958F0@DM5PR12MB2535.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB253567599A33CBC49F0DFEDD958F0@DM5PR12MB2535.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [198.54.100.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0034afe6-866b-4610-67ee-08d73b1b8bb6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1657; 
x-ms-traffictypediagnostic: DM5PR12MB1657:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1657799D956A0EB387BB26C9FC8F0@DM5PR12MB1657.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(189003)(199004)(66476007)(478600001)(7736002)(76116006)(25786009)(446003)(8676002)(81166006)(81156014)(6636002)(71200400001)(2906002)(71190400001)(86362001)(66066001)(26005)(5660300002)(476003)(4326008)(186003)(2616005)(91956017)(229853002)(6436002)(316002)(53546011)(486006)(6486002)(6506007)(54906003)(66946007)(558084003)(54896002)(6246003)(236005)(6512007)(99286004)(8936002)(76176011)(6862004)(11346002)(66446008)(6116002)(14454004)(3846002)(64756008)(37006003)(102836004)(36756003)(66556008)(33656002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1657;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hL1180rC3q3ZiVU2tNp6vAxfWAUjMq7QiLjn8kwoNUL20QrwCanoCKLQzHFaxo1VnWqBiz//fIzFnkA0Lg8pwWv4sUWdlR0MOG+85kqQXC8KJAVzJAbJLYSz29R+ZOtM630O1/ScoaFeofYxV0GmoXITqkYOvmQCX2/gqHew9bs0n4Q83liPAwNeElNa5nNouoXbz1h5+IoQjnkBma2Hp1WUAChLykD/noxBTyy/7Qg7N2oZ31Aev0a7GyKn8nQms+EyQvPd3aSprMytAGC0818U10RP4WLpHB9bzh5cKV09y/8cdXH2pBJ3yFSht7LIlxw+nuKnIvwhePDMSOFpdvBnXbdJ6vFRnHl//TAf1eEb4DYIYX2kxWK4vKeDekNbl0KILdzrkmQPYjMc3K29I2FVCy/VyWfs+WCyFZS9gnk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0034afe6-866b-4610-67ee-08d73b1b8bb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 03:02:58.8118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wO/kDNS1z5AE4UxZzLgpHUPCBWEJeiVNCXrck0Muw4UrvBI5RzDdH17KhZoFpXuQhlA7QU5huf2NPSPEpIje0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1657
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhCEwlhbjmVxQJUbSzT3ql9A4yGVNJKZv5JfS4y+MKg=;
 b=pYaKfkJbM+8hHX8p8/XrDPVlFawdVO1LCD4nzP0+V1AYCNBXeUf4dO0gJw4c3w15bTmBFKMyuw+WN26pMuxlzrPt37vVjnLDii7xw0v1/0VcBXcj5eI/FWSgD5zuVntl43SakcHoxvjwo5cjBJvOLyqBP5Nj7rpEd5ejIFmff0s=
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
Cc: "Long, Gang" <Gang.Long@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, "Xu,
 Feifei" <Feifei.Xu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: multipart/mixed; boundary="===============1135518536=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1135518536==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_21ED1B7F2E7C483BB1DC690A862F5908amdcom_"

--_000_21ED1B7F2E7C483BB1DC690A862F5908amdcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbTxtYWlsdG86
SGF3a2luZy5aaGFuZ0BhbWQuY29tPj4NCg0KUmVnYXJkcywNCkhhd2tpbmcNCg0KU2VudCBmcm9t
IG15IGlQaG9uZQ0KDQpPbiBTZXAgMTYsIDIwMTksIGF0IDIyOjU3LCBZaW4sIFRpYW5jaSAoUmlj
bykgPFRpYW5jaS5ZaW5AYW1kLmNvbTxtYWlsdG86VGlhbmNpLllpbkBhbWQuY29tPj4gd3JvdGU6
DQoNCg0KPDAwMDEtZHJtLWFtZGdwdS1hZGQtbmF2aTEyLXBjaS1pZC5wYXRjaD4NCg==

--_000_21ED1B7F2E7C483BB1DC690A862F5908amdcom_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IGRpcj0iYXV0byI+DQpS
ZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOkhhd2tpbmcuWmhh
bmdAYW1kLmNvbSI+SGF3a2luZy5aaGFuZ0BhbWQuY29tPC9hPiZndDsNCjxkaXY+PGJyPg0KPC9k
aXY+DQo8ZGl2PlJlZ2FyZHMsPC9kaXY+DQo8ZGl2Pkhhd2tpbmc8YnI+DQo8YnI+DQo8ZGl2IGlk
PSJBcHBsZU1haWxTaWduYXR1cmUiIGRpcj0ibHRyIj5TZW50IGZyb20gbXkgaVBob25lPC9kaXY+
DQo8ZGl2IGRpcj0ibHRyIj48YnI+DQpPbiBTZXAgMTYsIDIwMTksIGF0IDIyOjU3LCBZaW4sIFRp
YW5jaSAoUmljbykgJmx0OzxhIGhyZWY9Im1haWx0bzpUaWFuY2kuWWluQGFtZC5jb20iPlRpYW5j
aS5ZaW5AYW1kLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4NCjxicj4NCjwvZGl2Pg0KPGJsb2NrcXVv
dGUgdHlwZT0iY2l0ZSI+DQo8ZGl2IGRpcj0ibHRyIj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7
IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Jsb2NrcXVv
dGU+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4NCjxkaXYgZGlyPSJsdHIiPiZsdDswMDAxLWRy
bS1hbWRncHUtYWRkLW5hdmkxMi1wY2ktaWQucGF0Y2gmZ3Q7PC9kaXY+DQo8L2Jsb2NrcXVvdGU+
DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_21ED1B7F2E7C483BB1DC690A862F5908amdcom_--

--===============1135518536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1135518536==--
