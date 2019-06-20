Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD97B4D210
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 17:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3411D6E5C3;
	Thu, 20 Jun 2019 15:24:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740042.outbound.protection.outlook.com [40.107.74.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983016E5C2
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 15:24:01 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2826.namprd12.prod.outlook.com (20.177.221.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Thu, 20 Jun 2019 15:24:00 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 15:24:00 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Kim, Jonathan"
 <Jonathan.Kim@amd.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: update df_v3_6 for xgmi perfmons
Thread-Topic: [PATCH 1/2] drm/amdgpu: update df_v3_6 for xgmi perfmons
Thread-Index: AQHVJwKQQHmqSIL4IUytMthKTBpOhaakkAUAgAAaUIA=
Date: Thu, 20 Jun 2019 15:23:59 +0000
Message-ID: <594a3303-a5bd-72b7-8e03-fe1b2b08a723@amd.com>
References: <20190620005313.56371-1-jonathan.kim@amd.com>
 <CADnq5_O81Mmf=4N+EL8P6ARrbhAo8wXRVKZB78N5Dj7e6+upLw@mail.gmail.com>
In-Reply-To: <CADnq5_O81Mmf=4N+EL8P6ARrbhAo8wXRVKZB78N5Dj7e6+upLw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-clientproxiedby: YTOPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::35) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80d5d43e-d465-4267-02fd-08d6f593517b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2826; 
x-ms-traffictypediagnostic: DM6PR12MB2826:
x-microsoft-antispam-prvs: <DM6PR12MB2826803C2543737E9397B71C92E40@DM6PR12MB2826.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(366004)(39860400002)(376002)(189003)(199004)(26005)(446003)(15650500001)(11346002)(2616005)(66446008)(486006)(316002)(256004)(6116002)(3846002)(478600001)(14444005)(53936002)(476003)(73956011)(8936002)(110136005)(68736007)(66946007)(58126008)(66556008)(66476007)(64756008)(31686004)(81156014)(8676002)(305945005)(5660300002)(7736002)(52116002)(4744005)(36756003)(229853002)(81166006)(6486002)(53546011)(72206003)(6636002)(76176011)(65806001)(65956001)(66066001)(6512007)(2906002)(386003)(71190400001)(64126003)(71200400001)(6506007)(25786009)(4326008)(186003)(14454004)(102836004)(86362001)(65826007)(99286004)(31696002)(6246003)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2826;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1wmwXHvnOAHmaD0TnJuwoeiacnl+zlrx/VzG4t8h4/6k5eoYUMVF2jEoMztIkq7mQttpGLabv6AufGQUqZpO71lOtRqVadJFnQ4O3n2FtqSYi6tr/OuyVmlf+51xR+56xhRM/xqCURYy1gWKHRcYfH6Olzam3bDgjWVCPT+C8ebfubbhfFYdEv9ZqI6Nx61l0nsT0zCsfC6i6ZZSuOF6N1Cxho1R+Zr0K2V29gADL2md6fEyd/Z8yhe6yk7YCLIjhhYVZ4GRvQGC1wUHExofgpc6CGnTsu2ngza5N99Jeu79SPb/FhVgSatdUc63Xk4crjWmYwUXIqjx3JFLc4gEXqWRiOaBxAcJPEGsPckuPbEQCa0AL/50RpvumGWcFYtHnieW0vqGbbb8xY1DuVQYEiKIxBCkuB2eRTKxayDKld8=
Content-ID: <8C087165EC789943ACB69EFD53A9AF7F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d5d43e-d465-4267-02fd-08d6f593517b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 15:23:59.9005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2826
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akUB8UzyalSI/OaCl2fP6I2WGpclcMM0Tw1eEHXVzmM=;
 b=RcdwqptguhGwhoSdguxIFTDfvUP6TfkY8WsA1MFuGd9Z1FyYXWE6VaMxkxyYbTdWI+0ZA3u19A8hzIPPEHziWlqf3I389LlgtEfqOVOj7dDgxO/em9jdY8ix7fu1rBmH+XeN4QW2/uq5Lo6DNAl2zrEhzzibyCPhBvNJ/+NtKwo=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yMCA5OjQ5LCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IFlvdSBuZXZlciBhZGRy
ZXNzZWQgbXkgY29tbWVudHMgYWJvdXQgZGYgaW5pdCBmcm9tIGJlZm9yZS4gIGRmX2luaXQNCj4g
Z2V0cyBjYWxsZWQgZnJvbSBod19pbml0LCBzbyB5b3Ugc2hvdWxkbid0IGNyZWF0ZSBmaWxlcy4g
IE1vdmUgZGYgaW5pdA0KPiB0byBiZWluZyBjYWxsZWQgZnJvbSBzb2MxNSBzd19pbml0L2Zpbmkg
YW5kIHByb2JhYmx5IHJlbmFtZSB0aGUgZGYNCj4gY2FsbGJhY2tzIHRvIHN3X2luaXQgYW5kIHN3
X2Zpbmkgc28gd2Uga25vdyBub3QgdG8gYWRkIGh3IHN0YXRlIHRvDQo+IHRob3NlIGZ1bmN0aW9u
cy4gIEFzIGlzIG5vdywgd2UnbGwgZW5kIHVwIG5lZWRsZXNzbHkgY3JlYXRpbmcgYW5kDQo+IGRl
c3RvcnlpbmcgZmlsZXMgb24gc3VzcGVuZC9yZXN1bWUuDQoNClNvcnJ5IEkgYWxzbyBtaXNzZWQg
dGhhdCBjb21tZW50IGFuZCB0aGUgaW1wbGljYXRpb25zLCBvciBJIHdvdWxkIGhhdmUgDQpwb2lu
dGVkIGl0IG91dCBpbiBteSBjb2RlIHJldmlldy4NCg0KSm9uJ3MgbGFzdCBwYXRjaCBsb29rcyBt
b3N0bHkgZ29vZCB0byBtZSBhbmQgSSB0aGluayBpdCBhZGRyZXNzZXMgdGhpcyANCndpdGggbWlu
aW1hbCBmdXNzLg0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCj4NCj4gQWxleA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
