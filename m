Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B54550B449
	for <lists+amd-gfx@lfdr.de>; Fri, 22 Apr 2022 11:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49A310F38B;
	Fri, 22 Apr 2022 09:43:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68D610E923
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Apr 2022 09:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVW+5O2R2Lw0kJwPcBjhptbGDwxqCogU8wW836UoU7tuBspZAG1PcnuELSAN3cotXl89Fr3tmR68MJHrGjQnhBqXJPjv4CFY+RgiiB1psyydK6TgLdDZnpIisb76d+9cAHs9e6GTl9Bb2vCK35YmWSqHVvYqPhWdjSyWnYiyDCDsQu8jOsv0rqGAalztI/XrjoUDV1seISaZspPV+bkGVbhKfe4Hof/9ZUXWwfZwLErPUGorw6TVAimJQE32JnavJD726hH8yMIjrYlDuWBbNvVKiXnY13BYJ24RuRoA6r2ANb0PpTBDtzlUy0/oYRZ5gMyYCkq0Tvk1s9kYr4yH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgmpX6NeKAJPzUXjEj2ob6HQ4fZ0k+XJhfa8Ulp7gvY=;
 b=ZGAI1dleyGghhbp1MiP3xMiRlFhhYIen5dnHKF/gRipRDMUp/ummdAdHEJBxiBtagG7IAXGddUdERiLdtjNqMWWTKBYok5LBj5jG1jfuJSsfDx0ofaZNVJd/PMAF6e4q1UFQ0csC1Y0Cg7KuEromJHaleqkKdm50uBieXf30+xBDm4DATBGzK2GEn26GUIKVdrQ4D8fe8ytZYDGJS2eSGAv2EZrEzyCBluh73/QUTO9nSntTn2R+9XJMTq1p0V4UIesVF+tJpNidWU8B3lQvAoXBZ9pdW0DFHUnDfG5O9Kv9uE+pUmrx/cEsK0DdADmOwbr0DPAuLUKaDvYwNqlz7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgmpX6NeKAJPzUXjEj2ob6HQ4fZ0k+XJhfa8Ulp7gvY=;
 b=uSg1+qMoIh3ph6I4NgirZ+/388ATkNOeDNFPECJpMMhCvnruoTKHbNYUFLtzOzvZU46qu5bpY3H3+F86t5pSbeMjRVCnVMX8R2XF47avLq/tbrKJC+yUyUvcThIYIRnClpMlbgdQoGm8WyA9nJaCLTq3bx221cJGIIwAJZRjq90=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 BN8PR12MB3427.namprd12.prod.outlook.com (2603:10b6:408:62::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Fri, 22 Apr 2022 09:43:07 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::8558:f9a2:7eec:cfa3]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::8558:f9a2:7eec:cfa3%6]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 09:43:07 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH V2] drm/amd/pm: fix the deadlock issue observed on SI
Thread-Topic: [PATCH V2] drm/amd/pm: fix the deadlock issue observed on SI
Thread-Index: AQHYTYHgfs1EKjpJg0KMdZLy10ULmazqfJmAgBErNoCAAAU4AIAAAsNggAAK5ACAAATLEA==
Date: Fri, 22 Apr 2022 09:43:07 +0000
Message-ID: <DM6PR12MB2619D176618A82BBA81AB100E4F79@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20220411085453.38063-1-evan.quan@amd.com>
 <371afc58-5ee7-8171-90c2-05bb163e40ea@amd.com>
 <DM6PR12MB26195A5106718D1661686DC6E4F79@DM6PR12MB2619.namprd12.prod.outlook.com>
 <e3adf823-670c-0067-d74b-0105f42fa85e@amd.com>
 <DM6PR12MB2619F866BE71603B28F339C3E4F79@DM6PR12MB2619.namprd12.prod.outlook.com>
 <ddb5a8a0-4be0-5479-78cb-528ea5d99161@amd.com>
In-Reply-To: <ddb5a8a0-4be0-5479-78cb-528ea5d99161@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-Mentions: Alexander.Deucher@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-04-22T09:43:03Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=ffa24c23-cc48-48c2-aba8-e7e1868004db;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30b5d8a3-a234-4b0b-5e4b-08da2444815a
x-ms-traffictypediagnostic: BN8PR12MB3427:EE_
x-microsoft-antispam-prvs: <BN8PR12MB3427C5342B62C2CA18210CDBE4F79@BN8PR12MB3427.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O5P+NK1UMOJCinwAs8VCk+zoZ0wZQk+8/iz9OnDWAVZwYVCFsVViyB5wmpNqKhfHo2IQeCvCu4Lza8MFTUJfPgcOgnOEd+wesmEEooeGs1++tRMTjXgXBORYsW855E8l9JT/y2mfKa4JKy6PeS8FgieYR8YtxdbIo+2Kdj9CL0En0uc87bim+qEpEg7BCLILvMGfFQlpcZp8ffSVDAhZR4+xBQNb4/JPVNluR0H9YLxuVgL3buyeIiAduC28yNhX8Oz5Qnw6/QpzaKNyVokxbSnko0V8cFUvqtgf8qyZa8sMiAOrEOXKhIIb+5lLGQXYHSedwXne0eFexG2V2p3Z4v62dpyaSdLO/bwfT/Iw1CGMW4nEZFWLFYJblHtSMkgD9cRmYIJ3uPD4brpfZtG6XuVrA1tNs79Bsz63YtEUSgog+2tCf7weot2fywiRH93UNka1GStlvz+tRhbDR7KZQPupaqevUCx7Tv1FDVqZE+vtOO4AmdDL5U8lEX9NurCOke31bm9VSgm1Cs3yT+/v+1FO/b9qkZ3sug/3K8nv4UNPsF6jtM0hSpxAH8G2z8Y0J1+/fMdV+Tf5jiqfwvk+iKCHz1QWtaJNrmdGNUUyrjEGduh1HsJ790iR+eO8A9iinYN9jUtl4j5dR8KgG6cfbL0zw9fWjRjPkkkgvjCeuuMxqXWy7jniV18OJQn2BpdQobBOjno5Qf3If7/t22FLuz6JGBdG0v8o08OXSam2ZKk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(6636002)(8936002)(54906003)(508600001)(71200400001)(83380400001)(38070700005)(52536014)(186003)(2906002)(38100700002)(6506007)(53546011)(30864003)(55016003)(9686003)(5660300002)(86362001)(26005)(4326008)(8676002)(316002)(66476007)(66446008)(33656002)(66556008)(7696005)(64756008)(122000001)(66946007)(76116006)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTJmbklSSk9yTjdhWGI4dGwzZ1gwQzVrdTRyczZGaEcyWVd3NjZSaHVPdmgz?=
 =?utf-8?B?dHhLNUQxb0NZTmJTV2wrWUYwY0dROExZN2xyb29xNFFxZXRTRDFhU3ZWL29F?=
 =?utf-8?B?T2JoVmUyem95QVVNaTE1ODVVeUtvUThBYUhGR3YxU2FscGZmM0piWDk5aldh?=
 =?utf-8?B?aXlCajdoaitONWJ2V2VVSm1ZTW9IZmwvczV0MnlxS2ZVcms1WmtVelAwYzFy?=
 =?utf-8?B?Q3BVMXB3U1RjYm1qdTYvbm10S0gySE0vUVNCb0QzWDBYMlp6bzZjRDloV1hC?=
 =?utf-8?B?eXVzbGduWnRCb0JaMTd2NHdNbllRRlI3OENTZmh3WFo4UzBCS1JibjAvMkI3?=
 =?utf-8?B?Sy9Fdm4xaWRmZFBlNG5YNjNFQXM0U01BdDBSV0NETDNMRHppdkNoN1NWT21l?=
 =?utf-8?B?N3JiRU11dFZhbXhBTEthMUhuSExkWktSTXNJdktwLzVJMWdZMGxRMTdaQXUx?=
 =?utf-8?B?aUs2dzFHUXBxVVZqZFVVcm43aW1mOG9HMTU2ZVljYjBXWFhScHdudUkyNzFv?=
 =?utf-8?B?NnVuWnN6bUFKOFd5M3ZHNEJYUy9icGFFTnRlVVNwQkZOM3FTNU1WY3FJcWNk?=
 =?utf-8?B?QmFLd3ZMNEJtdjJZdlo5OWR6RGVabHRsN2RaNEhRSFBnbnRRUVUyS0FVQTRn?=
 =?utf-8?B?TkVacEI5b3FPQ0hUdndMWkprUm5JaFBQRHJYNkgzeUJjTU9LeXVkMDBaakRZ?=
 =?utf-8?B?QUxkcFpGSzlVcWhJWkxJbDRnY2tCZm5LeUo4R1ptOG9pUWFmK0NlUmhJMXRX?=
 =?utf-8?B?WW1XcHFFNVhzTDYvdU5MNEMxQlprMGdrN3hpQUx1aWxFSkZYbzhFUUowbloz?=
 =?utf-8?B?YzJoUGtJdThqTHU0SnE2TlBuNFBrQ3p3Y0ZDMkdVa0JsRGMyd1pDKzRoejFw?=
 =?utf-8?B?VVh6UUxLdHVXZUxzc0RaK0I4YW1Nc3ZWV2NpUmliTHdzaWlraDJiSnNRNWNB?=
 =?utf-8?B?RUFtWWpHbXk5dE1pK2VaWmFGZEM4UjA2d0VQUWhLK3craUVzV0JIZVBCakw1?=
 =?utf-8?B?bTdSYmMzTDVLeTAzeEJxSGtBKzE5QjRHTWhYOEhOc1V1RFlQUFpVWUlmaU1L?=
 =?utf-8?B?c2YvQUxnZU9pNEVIQmdRSDg5dWpabk9oN0kxYWtWWGJMMENNLzdHck1xanZx?=
 =?utf-8?B?R2hkZERDMUt1OGJWKzRmbWFFSHc4ZmZFaHdIajN5cndRSWxjWktnMDZzTERn?=
 =?utf-8?B?R0tVcWdNTW9PT1FYTzJTU3ZBTDV3ZVZDUEpOTEUxYlhNQjRORTJSNEhpMVFo?=
 =?utf-8?B?N1psb2MxaS8rTkhUT2dwQ0s4WXZXN1RyUFdJb3pDcXFWM210OW5rQlVBWGQ5?=
 =?utf-8?B?VENsbGZ4MFg0ZUp3OHVySFAvWnoxSy85ekJnREZKOUdxK0Y3Y0g1eEwwRlpJ?=
 =?utf-8?B?OGN4RzYyZ3FaQ2FNeGxjc2tvSnNjUFFyNXB6S2RuMmppYzlPUFdkaHloK09t?=
 =?utf-8?B?YlhnWk1vSjZJS29QSERVdkl4aXg5TEdWK0pLMHlhT0dFRjhpb3F5NnJaaW5N?=
 =?utf-8?B?bFI4UEpuc2pBaGl4UXlyOEZhcXF5TDcrMmZMTmljWmFuUGt2V1puL0JDelZE?=
 =?utf-8?B?alVkQ2ZsSloyM0hXeUpUSjhycXhmUk1TY2wybllpZ01tNlJQd0JzREtaYUt1?=
 =?utf-8?B?c2g0c1g0d0tNYW1BTVc2cnQ0QVpZZ1ZRZlFRY0N4R0JXOFByWXNwTEg5aEp2?=
 =?utf-8?B?dkE0TkJJcTMxd0MzUytaR2xjTnZ5R3hCQ1Z4SFZGdWF2MEhhdThFOUVjUG96?=
 =?utf-8?B?UEd5ejBsRDA1emtDclpmQWdpTS9kTThFNnN6RW1RbTBMeFZNN1U2c2tDRXFB?=
 =?utf-8?B?S3V6bXJGK2JVRzNSeEtxRVUrS2JuOUFUL2Fjbm5PV09CV01zWEZROUhHbHBQ?=
 =?utf-8?B?OHlsa25oM0VKdWlFREQxc0x0STdiQlByM0V3SUtuVmtCb3o1T3NJUzhNSXVj?=
 =?utf-8?B?UVVRQnFqZlNnZXFhZS9KcE1TOGNkOXJOL2Y3TVVIZldqelQrY043M0o0MFBi?=
 =?utf-8?B?L1d1Uy81S3lQeFZnWVp3ak1DcEdvZmFLa2NjVk1ZR25OMzlORGNtdkZSQ09X?=
 =?utf-8?B?OVBjaVpjY1VZdTBXdnhLUVZHczlYSE5FdU4rZE5tTXppVkh4ZjlhbWFtMDB2?=
 =?utf-8?B?Y2J6Z250ZnVjRjN5Y0l5T1RCYlN3ZFArVm5EVUxzbllLM2hDdWNOTEtRTnFy?=
 =?utf-8?B?UVN6S1JWakZxWDdwM3J1OWl0L0YvYkgwOXJESVB4eERFYTVWNWo0ektOR3Uz?=
 =?utf-8?B?ZDV0MXYxQjZMMSsweUdxSG50bGI0ZnQ3dVROaEpISEYzV1RZRWUwL2R5YXNF?=
 =?utf-8?Q?aS82VujxqPQd8c/J8J?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b5d8a3-a234-4b0b-5e4b-08da2444815a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 09:43:07.2280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kcf+b5guCgLtJo6N25H4xjtW8yhn7bWmxRYwbWOsWvtRRzopgJXNFMOjGFGCaLMb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3427
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>,
 "arthur.marsh@internode.on.net" <arthur.marsh@internode.on.net>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KVGhhbmtzIExpam8uDQpARGV1Y2hlciwgQWxleGFu
ZGVyIEkganVzdCBsYW5kZWQgdGhlIGNoYW5nZSBvbiBvdXIgZHJtLW5leHQgYnJhbmNoLg0KDQpC
Ug0KRXZhbg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXphciwgTGlq
byA8TGlqby5MYXphckBhbWQuY29tPg0KPiBTZW50OiBGcmlkYXksIEFwcmlsIDIyLCAyMDIyIDU6
MjUgUE0NCj4gVG86IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsgYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRl
dWNoZXJAYW1kLmNvbT47DQo+IHBtZW56ZWxAbW9sZ2VuLm1wZy5kZTsgYXJ0aHVyLm1hcnNoQGlu
dGVybm9kZS5vbi5uZXQNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMl0gZHJtL2FtZC9wbTogZml4
IHRoZSBkZWFkbG9jayBpc3N1ZSBvYnNlcnZlZCBvbiBTSQ0KPiANCj4gDQo+IA0KPiBPbiA0LzIy
LzIwMjIgMjoyMyBQTSwgUXVhbiwgRXZhbiB3cm90ZToNCj4gPiBbQU1EIE9mZmljaWFsIFVzZSBP
bmx5XQ0KPiA+DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
PiBGcm9tOiBMYXphciwgTGlqbyA8TGlqby5MYXphckBhbWQuY29tPg0KPiA+PiBTZW50OiBGcmlk
YXksIEFwcmlsIDIyLCAyMDIyIDQ6MzYgUE0NCj4gPj4gVG86IFF1YW4sIEV2YW4gPEV2YW4uUXVh
bkBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4gQ2M6IERldWNo
ZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47DQo+ID4+IHBtZW56ZWxA
bW9sZ2VuLm1wZy5kZTsgYXJ0aHVyLm1hcnNoQGludGVybm9kZS5vbi5uZXQNCj4gPj4gU3ViamVj
dDogUmU6IFtQQVRDSCBWMl0gZHJtL2FtZC9wbTogZml4IHRoZSBkZWFkbG9jayBpc3N1ZSBvYnNl
cnZlZA0KPiA+PiBvbiBTSQ0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiA0LzIyLzIwMjIgMTo1
NyBQTSwgUXVhbiwgRXZhbiB3cm90ZToNCj4gPj4+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHldDQo+
ID4+Pg0KPiA+Pj4NCj4gPj4+DQo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
Pj4+PiBGcm9tOiBMYXphciwgTGlqbyA8TGlqby5MYXphckBhbWQuY29tPg0KPiA+Pj4+IFNlbnQ6
IE1vbmRheSwgQXByaWwgMTEsIDIwMjIgNjowNiBQTQ0KPiA+Pj4+IFRvOiBRdWFuLCBFdmFuIDxF
dmFuLlF1YW5AYW1kLmNvbT47IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+
Pj4+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+Ow0K
PiA+Pj4+IHBtZW56ZWxAbW9sZ2VuLm1wZy5kZTsgYXJ0aHVyLm1hcnNoQGludGVybm9kZS5vbi5u
ZXQNCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIFYyXSBkcm0vYW1kL3BtOiBmaXggdGhlIGRl
YWRsb2NrIGlzc3VlIG9ic2VydmVkDQo+ID4+Pj4gb24gU0kNCj4gPj4+Pg0KPiA+Pj4+DQo+ID4+
Pj4NCj4gPj4+PiBPbiA0LzExLzIwMjIgMjoyNCBQTSwgRXZhbiBRdWFuIHdyb3RlOg0KPiA+Pj4+
PiBUaGUgYWRldi0+cG0ubXV0eCBpcyBhbHJlYWR5IGhlbGQgYXQgdGhlIGJlZ2lubmluZyBvZg0K
PiA+Pj4+Pg0KPiA+Pj4+DQo+ID4+DQo+IGFtZGdwdV9kcG1fY29tcHV0ZV9jbG9ja3MvYW1kZ3B1
X2RwbV9lbmFibGVfdXZkL2FtZGdwdV9kcG1fDQo+ID4+Pj4gZW5hYmxlX3ZjZS4NCj4gPj4+Pj4g
QnV0IG9uIHRoZWlyIGNhbGxpbmcgcGF0aCwgYW1kZ3B1X2Rpc3BsYXlfYmFuZHdpZHRoX3VwZGF0
ZSB3aWxsIGJlDQo+ID4+Pj4+IGNhbGxlZCBhbmQgdGh1cyBpdHMgc3ViIGZ1bmN0aW9ucyBhbWRn
cHVfZHBtX2dldF9zY2xrL21jbGsuIFRoZXkNCj4gPj4+Pj4gd2lsbCB0aGVuIHRyeSB0byBhY3F1
aXJlIHRoZSBzYW1lIGFkZXYtPnBtLm11dGV4IGFuZCBkZWFkbG9jayB3aWxsDQo+ID4+IG9jY3Vy
Lg0KPiA+Pj4+Pg0KPiA+Pj4+DQo+ID4+Pj4gV2hhdCBhYm91dCB1c2luZyBsb2NrZWQgdmVyc2lv
bnMgb2YgZ2V0X3NjbGsvbWNsayBhbmQgbGVhdmUgdGhlDQo+ID4+Pj4gcmVzdCBhcyB0aGV5IGFy
ZT8NCj4gPj4+IFtRdWFuLCBFdmFuXSBZZWFoLCB0aGF0KGFkZGluZyB0d28gbmV3IEFQSXMgZm9y
IGxvY2tlZCB2ZXJzaW9ucyBvZg0KPiA+PiBnZXRfc2Nsay9tY2xrKSBzaG91bGQgYWxzbyB3b3Jr
LiBCdXQgY29uc2lkZXJpbmcgdGhlcmUgY2Fubm90IGJlDQo+ID4+IG90aGVyIEFTSUNzIHdobyBu
ZWVkIHRoZW0sIHRoZXkgYXJlIGtpbmQgb2YgcmVkdW5kYW50Lg0KPiA+Pj4gTWVhbndoaWxlIG15
IHZlcnNpb24gaXMganVzdCB0byBnZXQgZXZlcnl0aGluZyByZXZlcnRlZCBiYWNrIHRvIGl0cw0K
PiBvcmlnaW5hbC4NCj4gPj4gU28sIGl0IHNob3VsZCBiZSBxdWl0ZSBzYWZlLiBIb3cgZG8geW91
IHRoaW5rPw0KPiA+Pj4NCj4gPj4NCj4gPj4gQXMgZmFyIGFzIEkgc2VlIC0NCj4gPj4NCj4gPj4g
MSkgSXQgbW92ZXMgZGlzcGxheSB3YXRlcm1hcmsgdXBkYXRlcyBvdXRzaWRlIG9mIGxvY2tpbmcN
Cj4gPj4gMikgSXQgYWRkcyBiYW5kd2lkdGggdXBkYXRlIHVuZGVyIGNvbW1vbiBjb21wdXRlX2Ns
b2NrcyBwYXRocy4NCj4gPiBbUXVhbiwgRXZhbl0gSSBzdXBwb3NlIHdoYXQgeW91IG1lbnRpb25l
ZCBpcyBhYm91dA0KPiAiYW1kZ3B1X2Rpc3BsYXlfYmFuZHdpZHRoX3VwZGF0ZSIuDQo+ID4gTm8s
IEkganVzdCBkb3VibGUgY29uZmlybWVkKHRoZSBvbGQgY29kZSBpbiBvdXIgYW1kLXN0YWdpbmct
ZGttcy01LjkvNS4xMA0KPiBicmFuY2gpIGFuZCBpdCBkaWQgY29tZSB3aXRoIG5vIGxvY2sgcHJv
dGVjdGlvbi4NCj4gPiBGb3IgdGhvc2UgbGVnYWN5IEFTSUNzLCB0aGUgd2F0ZXJtYXJrIHNldHRp
bmcgd2FzIHBlcmZvcm1lZCBieQ0KPiBwcm9ncmFtbWluZyByZWdpc3RlcnMgZGlyZWN0bHkoaGFu
ZGxlZCBhdCBkaXNwbGF5IHNpZGUpLg0KPiA+IFRoYXQgbWlnaHQgZXhwbGFpbiB3aHkgaXQgZGlk
IG5vdCBoYXZlIGxvY2sgcHJvdGVjdGlvbiBhcyByZWNlbnQgQVNJQ3MuDQo+ID4NCj4gDQo+IFll
cywgSSB3YXMgcmVmZXJyaW5nIHRvIGFtZGdwdV9kaXNwbGF5X2JhbmR3aWR0aF91cGRhdGUuIFlv
dSBhcmUgcmlnaHQsIEkNCj4gc2VlIGl0IGdldHRpbmcgY2FsbGVkIG91dHNpZGUgb2YgcG0gbXV0
ZXggYXQgbGVhc3QuIEFsc28gaXQgaXMgY2FsbGVkIGNvbW1vbmx5IGluDQo+IGFtZGdwdV9wbV9j
b21wdXRlX2Nsb2Nrcy4NCj4gDQo+IExldCdzIHByb2NlZWQgaXQgdGhpcyB3YXkgZm9yIG5vdy4N
Cj4gDQo+IFJldmlld2VkLWJ5OiBMaWpvIExhemFyIDxsaWpvLmxhemFyQGFtZC5jb20+DQo+IA0K
PiBUaGFua3MsDQo+IExpam8NCj4gDQo+ID4gQlINCj4gPiBFdmFuDQo+ID4+DQo+ID4+IEkgZ3Vl
c3MgaXQgaXMgbm90IHRoZSBzYW1lIGFzIHByZS1tdXRleCBjaGFuZ2UuDQo+ID4+DQo+ID4+IFRo
YW5rcywNCj4gPj4gTGlqbw0KPiA+Pg0KPiA+Pj4gQlINCj4gPj4+IEV2YW4NCj4gPj4+Pg0KPiA+
Pj4+IFRoYW5rcywNCj4gPj4+PiBMaWpvDQo+ID4+Pj4NCj4gPj4+Pj4gQnkgcGxhY2luZyBhbWRn
cHVfZGlzcGxheV9iYW5kd2lkdGhfdXBkYXRlIG91dHNpZGUgb2YgYWRldi0NCj4gPj4gcG0ubXV0
ZXgNCj4gPj4+Pj4gcHJvdGVjdGlvbihjb25zaWRlcmluZyBsb2dpY2FsbHkgdGhleSBkbyBub3Qg
bmVlZCBzdWNoIHByb3RlY3Rpb24pDQo+ID4+Pj4+IGFuZCByZXN0cnVjdHVyaW5nIHRoZSBjYWxs
IGZsb3cgYWNjb3JkaW5nbHksIHdlIGNhbiBlbGltaW5hdGUgdGhlDQo+ID4+Pj4+IGRlYWRsb2Nr
IGlzc3VlLiBUaGlzIGNvbWVzIHdpdGggbm8gcmVhbCBsb2dpY3MgY2hhbmdlLg0KPiA+Pj4+Pg0K
PiA+Pj4+PiBGaXhlczogMzcxMmU3YTQ5NDU5ICgiZHJtL2FtZC9wbTogdW5pZmllZCBsb2NrIHBy
b3RlY3Rpb25zIGluDQo+ID4+Pj4+IGFtZGdwdV9kcG0uYyIpDQo+ID4+Pj4+IFJlcG9ydGVkLWJ5
OiBQYXVsIE1lbnplbCA8cG1lbnplbEBtb2xnZW4ubXBnLmRlPg0KPiA+Pj4+PiBSZXBvcnRlZC1i
eTogQXJ0aHVyIE1hcnNoIDxhcnRodXIubWFyc2hAaW50ZXJub2RlLm9uLm5ldD4NCj4gPj4+Pj4g
TGluazogaHR0cHM6DQo+ID4+Pj4+IC8vbG9yZS5rZXJuZWwub3JnL2FsbC85ZTY4OWZlYS02YzY5
LWY0YjAtOGRlZS0NCj4gPj4gMzJjNGNmN2Q4ZjljQG1vbGdlbi5tcGcuDQo+ID4+Pj4+IGRlLw0K
PiA+Pj4+PiBCdWdMaW5rOiBodHRwczogLy9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9hbWQv
LS9pc3N1ZXMvMTk1Nw0KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVh
bkBhbWQuY29tPg0KPiA+Pj4+PiAtLQ0KPiA+Pj4+PiB2MS0+djI6DQo+ID4+Pj4+ICAgICAgLSBy
aWNoIHRoZSBjb21taXQgbWVzc2FnZXMoUGF1bCkNCj4gPj4+Pj4gLS0tDQo+ID4+Pj4+ICAgICBk
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL2FtZGdwdV9kcG0uYyAgICAgICAgICAgfCAzOQ0KPiA+Pj4+
ICsrKysrKysrKysrKysrKysrKysNCj4gPj4+Pj4gICAgIC4uLi9ncHUvZHJtL2FtZC9wbS9sZWdh
Y3ktZHBtL2xlZ2FjeV9kcG0uYyAgICB8IDEwIC0tLS0tDQo+ID4+Pj4+ICAgICBkcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL2xlZ2FjeS1kcG0vc2lfZHBtLmMgICAgfCAzNSAtLS0tLS0tLS0tLS0tLS0N
Cj4gLS0NCj4gPj4+Pj4gICAgIC4uLi9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvYW1kX3Bvd2Vy
cGxheS5jICB8IDEwIC0tLS0tDQo+ID4+Pj4+ICAgICA0IGZpbGVzIGNoYW5nZWQsIDM5IGluc2Vy
dGlvbnMoKyksIDU1IGRlbGV0aW9ucygtKQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVfZHBtLmMNCj4gPj4+Pj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL2FtZGdwdV9kcG0uYw0KPiA+Pj4+PiBpbmRleCA1NTA0ZDgxYzc3YjcuLjcy
ZTdiNWQ0MGFmNiAxMDA2NDQNCj4gPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9h
bWRncHVfZHBtLmMNCj4gPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVf
ZHBtLmMNCj4gPj4+Pj4gQEAgLTQyNyw2ICs0MjcsNyBAQCBpbnQgYW1kZ3B1X2RwbV9yZWFkX3Nl
bnNvcihzdHJ1Y3QNCj4gPj4+PiBhbWRncHVfZGV2aWNlICphZGV2LCBlbnVtIGFtZF9wcF9zZW5z
b3JzIHNlbnNvDQo+ID4+Pj4+ICAgICB2b2lkIGFtZGdwdV9kcG1fY29tcHV0ZV9jbG9ja3Moc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ID4+Pj4+ICAgICB7DQo+ID4+Pj4+ICAgICAJY29u
c3Qgc3RydWN0IGFtZF9wbV9mdW5jcyAqcHBfZnVuY3MgPQ0KPiA+Pj4+PiBhZGV2LT5wb3dlcnBs
YXkucHBfZnVuY3M7DQo+ID4+Pj4+ICsJaW50IGk7DQo+ID4+Pj4+DQo+ID4+Pj4+ICAgICAJaWYg
KCFhZGV2LT5wbS5kcG1fZW5hYmxlZCkNCj4gPj4+Pj4gICAgIAkJcmV0dXJuOw0KPiA+Pj4+PiBA
QCAtNDM0LDYgKzQzNSwxNSBAQCB2b2lkIGFtZGdwdV9kcG1fY29tcHV0ZV9jbG9ja3Moc3RydWN0
DQo+ID4+Pj4gYW1kZ3B1X2RldmljZSAqYWRldikNCj4gPj4+Pj4gICAgIAlpZiAoIXBwX2Z1bmNz
LT5wbV9jb21wdXRlX2Nsb2NrcykNCj4gPj4+Pj4gICAgIAkJcmV0dXJuOw0KPiA+Pj4+Pg0KPiA+
Pj4+PiArCWlmIChhZGV2LT5tb2RlX2luZm8ubnVtX2NydGMpDQo+ID4+Pj4+ICsJCWFtZGdwdV9k
aXNwbGF5X2JhbmR3aWR0aF91cGRhdGUoYWRldik7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKwlmb3Ig
KGkgPSAwOyBpIDwgQU1ER1BVX01BWF9SSU5HUzsgaSsrKSB7DQo+ID4+Pj4+ICsJCXN0cnVjdCBh
bWRncHVfcmluZyAqcmluZyA9IGFkZXYtPnJpbmdzW2ldOw0KPiA+Pj4+PiArCQlpZiAocmluZyAm
JiByaW5nLT5zY2hlZC5yZWFkeSkNCj4gPj4+Pj4gKwkJCWFtZGdwdV9mZW5jZV93YWl0X2VtcHR5
KHJpbmcpOw0KPiA+Pj4+PiArCX0NCj4gPj4+Pj4gKw0KPiA+Pj4+PiAgICAgCW11dGV4X2xvY2so
JmFkZXYtPnBtLm11dGV4KTsNCj4gPj4+Pj4gICAgIAlwcF9mdW5jcy0+cG1fY29tcHV0ZV9jbG9j
a3MoYWRldi0NCj4gPnBvd2VycGxheS5wcF9oYW5kbGUpOw0KPiA+Pj4+PiAgICAgCW11dGV4X3Vu
bG9jaygmYWRldi0+cG0ubXV0ZXgpOyBAQCAtNDQzLDYgKzQ1MywyMCBAQA0KPiB2b2lkDQo+ID4+
Pj4+IGFtZGdwdV9kcG1fZW5hYmxlX3V2ZChzdHJ1Y3QNCj4gPj4+PiBhbWRncHVfZGV2aWNlICph
ZGV2LCBib29sIGVuYWJsZSkNCj4gPj4+Pj4gICAgIHsNCj4gPj4+Pj4gICAgIAlpbnQgcmV0ID0g
MDsNCj4gPj4+Pj4NCj4gPj4+Pj4gKwlpZiAoYWRldi0+ZmFtaWx5ID09IEFNREdQVV9GQU1JTFlf
U0kpIHsNCj4gPj4+Pj4gKwkJbXV0ZXhfbG9jaygmYWRldi0+cG0ubXV0ZXgpOw0KPiA+Pj4+PiAr
CQlpZiAoZW5hYmxlKSB7DQo+ID4+Pj4+ICsJCQlhZGV2LT5wbS5kcG0udXZkX2FjdGl2ZSA9IHRy
dWU7DQo+ID4+Pj4+ICsJCQlhZGV2LT5wbS5kcG0uc3RhdGUgPQ0KPiA+Pj4+IFBPV0VSX1NUQVRF
X1RZUEVfSU5URVJOQUxfVVZEOw0KPiA+Pj4+PiArCQl9IGVsc2Ugew0KPiA+Pj4+PiArCQkJYWRl
di0+cG0uZHBtLnV2ZF9hY3RpdmUgPSBmYWxzZTsNCj4gPj4+Pj4gKwkJfQ0KPiA+Pj4+PiArCQlt
dXRleF91bmxvY2soJmFkZXYtPnBtLm11dGV4KTsNCj4gPj4+Pj4gKw0KPiA+Pj4+PiArCQlhbWRn
cHVfZHBtX2NvbXB1dGVfY2xvY2tzKGFkZXYpOw0KPiA+Pj4+PiArCQlyZXR1cm47DQo+ID4+Pj4+
ICsJfQ0KPiA+Pj4+PiArDQo+ID4+Pj4+ICAgICAJcmV0ID0gYW1kZ3B1X2RwbV9zZXRfcG93ZXJn
YXRpbmdfYnlfc211KGFkZXYsDQo+ID4+Pj4gQU1EX0lQX0JMT0NLX1RZUEVfVVZELCAhZW5hYmxl
KTsNCj4gPj4+Pj4gICAgIAlpZiAocmV0KQ0KPiA+Pj4+PiAgICAgCQlEUk1fRVJST1IoIkRwbSAl
cyB1dmQgZmFpbGVkLCByZXQgPSAlZC4gXG4iLCBAQA0KPiAtNDUzLDYNCj4gPj4+PiArNDc3LDIx
IEBADQo+ID4+Pj4+IHZvaWQgYW1kZ3B1X2RwbV9lbmFibGVfdmNlKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCBib29sDQo+ID4+IGVuYWJsZSkNCj4gPj4+Pj4gICAgIHsNCj4gPj4+Pj4gICAg
IAlpbnQgcmV0ID0gMDsNCj4gPj4+Pj4NCj4gPj4+Pj4gKwlpZiAoYWRldi0+ZmFtaWx5ID09IEFN
REdQVV9GQU1JTFlfU0kpIHsNCj4gPj4+Pj4gKwkJbXV0ZXhfbG9jaygmYWRldi0+cG0ubXV0ZXgp
Ow0KPiA+Pj4+PiArCQlpZiAoZW5hYmxlKSB7DQo+ID4+Pj4+ICsJCQlhZGV2LT5wbS5kcG0udmNl
X2FjdGl2ZSA9IHRydWU7DQo+ID4+Pj4+ICsJCQkvKiBYWFggc2VsZWN0IHZjZSBsZXZlbCBiYXNl
ZCBvbiByaW5nL3Rhc2sgKi8NCj4gPj4+Pj4gKwkJCWFkZXYtPnBtLmRwbS52Y2VfbGV2ZWwgPQ0K
PiA+Pj4+IEFNRF9WQ0VfTEVWRUxfQUNfQUxMOw0KPiA+Pj4+PiArCQl9IGVsc2Ugew0KPiA+Pj4+
PiArCQkJYWRldi0+cG0uZHBtLnZjZV9hY3RpdmUgPSBmYWxzZTsNCj4gPj4+Pj4gKwkJfQ0KPiA+
Pj4+PiArCQltdXRleF91bmxvY2soJmFkZXYtPnBtLm11dGV4KTsNCj4gPj4+Pj4gKw0KPiA+Pj4+
PiArCQlhbWRncHVfZHBtX2NvbXB1dGVfY2xvY2tzKGFkZXYpOw0KPiA+Pj4+PiArCQlyZXR1cm47
DQo+ID4+Pj4+ICsJfQ0KPiA+Pj4+PiArDQo+ID4+Pj4+ICAgICAJcmV0ID0gYW1kZ3B1X2RwbV9z
ZXRfcG93ZXJnYXRpbmdfYnlfc211KGFkZXYsDQo+ID4+Pj4gQU1EX0lQX0JMT0NLX1RZUEVfVkNF
LCAhZW5hYmxlKTsNCj4gPj4+Pj4gICAgIAlpZiAocmV0KQ0KPiA+Pj4+PiAgICAgCQlEUk1fRVJS
T1IoIkRwbSAlcyB2Y2UgZmFpbGVkLCByZXQgPSAlZC4gXG4iLCBkaWZmIC0tDQo+IGdpdA0KPiA+
Pj4+PiBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vbGVnYWN5LWRwbS9sZWdhY3lfZHBtLmMNCj4g
Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2xlZ2FjeS1kcG0vbGVnYWN5X2RwbS5jDQo+
ID4+Pj4+IGluZGV4IDk2MTNjNjE4MWMxNy4uZDNmZTE0OWQ4NDc2IDEwMDY0NA0KPiA+Pj4+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2xlZ2FjeS1kcG0vbGVnYWN5X2RwbS5jDQo+ID4+
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vbGVnYWN5LWRwbS9sZWdhY3lfZHBtLmMN
Cj4gPj4+Pj4gQEAgLTEwMjgsMTYgKzEwMjgsNiBAQCBzdGF0aWMgaW50DQo+ID4+Pj4gYW1kZ3B1
X2RwbV9jaGFuZ2VfcG93ZXJfc3RhdGVfbG9ja2VkKHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+ID4+
ICphZGV2KQ0KPiA+Pj4+PiAgICAgdm9pZCBhbWRncHVfbGVnYWN5X2RwbV9jb21wdXRlX2Nsb2Nr
cyh2b2lkICpoYW5kbGUpDQo+ID4+Pj4+ICAgICB7DQo+ID4+Pj4+ICAgICAJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UNCj4gKiloYW5kbGU7DQo+ID4+
Pj4+IC0JaW50IGkgPSAwOw0KPiA+Pj4+PiAtDQo+ID4+Pj4+IC0JaWYgKGFkZXYtPm1vZGVfaW5m
by5udW1fY3J0YykNCj4gPj4+Pj4gLQkJYW1kZ3B1X2Rpc3BsYXlfYmFuZHdpZHRoX3VwZGF0ZShh
ZGV2KTsNCj4gPj4+Pj4gLQ0KPiA+Pj4+PiAtCWZvciAoaSA9IDA7IGkgPCBBTURHUFVfTUFYX1JJ
TkdTOyBpKyspIHsNCj4gPj4+Pj4gLQkJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gYWRldi0+
cmluZ3NbaV07DQo+ID4+Pj4+IC0JCWlmIChyaW5nICYmIHJpbmctPnNjaGVkLnJlYWR5KQ0KPiA+
Pj4+PiAtCQkJYW1kZ3B1X2ZlbmNlX3dhaXRfZW1wdHkocmluZyk7DQo+ID4+Pj4+IC0JfQ0KPiA+
Pj4+Pg0KPiA+Pj4+PiAgICAgCWFtZGdwdV9kcG1fZ2V0X2FjdGl2ZV9kaXNwbGF5cyhhZGV2KTsN
Cj4gPj4+Pj4NCj4gPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vbGVn
YWN5LWRwbS9zaV9kcG0uYw0KPiA+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vbGVnYWN5
LWRwbS9zaV9kcG0uYw0KPiA+Pj4+PiBpbmRleCBjYWFlNTQ0ODdmOWMuLjYzM2RhYjE0ZjUxYyAx
MDA2NDQNCj4gPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9sZWdhY3ktZHBtL3Np
X2RwbS5jDQo+ID4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vbGVnYWN5LWRwbS9z
aV9kcG0uYw0KPiA+Pj4+PiBAQCAtMzg5Miw0MCArMzg5Miw2IEBAIHN0YXRpYyBpbnQgc2lfc2V0
X2Jvb3Rfc3RhdGUoc3RydWN0DQo+ID4+Pj4gYW1kZ3B1X2RldmljZSAqYWRldikNCj4gPj4+Pj4g
ICAgIH0NCj4gPj4+Pj4gICAgICNlbmRpZg0KPiA+Pj4+Pg0KPiA+Pj4+PiAtc3RhdGljIGludCBz
aV9zZXRfcG93ZXJnYXRpbmdfYnlfc211KHZvaWQgKmhhbmRsZSwNCj4gPj4+Pj4gLQkJCQkgICAg
IHVpbnQzMl90IGJsb2NrX3R5cGUsDQo+ID4+Pj4+IC0JCQkJICAgICBib29sIGdhdGUpDQo+ID4+
Pj4+IC17DQo+ID4+Pj4+IC0Jc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFt
ZGdwdV9kZXZpY2UNCj4gKiloYW5kbGU7DQo+ID4+Pj4+IC0NCj4gPj4+Pj4gLQlzd2l0Y2ggKGJs
b2NrX3R5cGUpIHsNCj4gPj4+Pj4gLQljYXNlIEFNRF9JUF9CTE9DS19UWVBFX1VWRDoNCj4gPj4+
Pj4gLQkJaWYgKCFnYXRlKSB7DQo+ID4+Pj4+IC0JCQlhZGV2LT5wbS5kcG0udXZkX2FjdGl2ZSA9
IHRydWU7DQo+ID4+Pj4+IC0JCQlhZGV2LT5wbS5kcG0uc3RhdGUgPQ0KPiA+Pj4+IFBPV0VSX1NU
QVRFX1RZUEVfSU5URVJOQUxfVVZEOw0KPiA+Pj4+PiAtCQl9IGVsc2Ugew0KPiA+Pj4+PiAtCQkJ
YWRldi0+cG0uZHBtLnV2ZF9hY3RpdmUgPSBmYWxzZTsNCj4gPj4+Pj4gLQkJfQ0KPiA+Pj4+PiAt
DQo+ID4+Pj4+IC0JCWFtZGdwdV9sZWdhY3lfZHBtX2NvbXB1dGVfY2xvY2tzKGhhbmRsZSk7DQo+
ID4+Pj4+IC0JCWJyZWFrOw0KPiA+Pj4+PiAtCWNhc2UgQU1EX0lQX0JMT0NLX1RZUEVfVkNFOg0K
PiA+Pj4+PiAtCQlpZiAoIWdhdGUpIHsNCj4gPj4+Pj4gLQkJCWFkZXYtPnBtLmRwbS52Y2VfYWN0
aXZlID0gdHJ1ZTsNCj4gPj4+Pj4gLQkJCS8qIFhYWCBzZWxlY3QgdmNlIGxldmVsIGJhc2VkIG9u
IHJpbmcvdGFzayAqLw0KPiA+Pj4+PiAtCQkJYWRldi0+cG0uZHBtLnZjZV9sZXZlbCA9DQo+ID4+
Pj4gQU1EX1ZDRV9MRVZFTF9BQ19BTEw7DQo+ID4+Pj4+IC0JCX0gZWxzZSB7DQo+ID4+Pj4+IC0J
CQlhZGV2LT5wbS5kcG0udmNlX2FjdGl2ZSA9IGZhbHNlOw0KPiA+Pj4+PiAtCQl9DQo+ID4+Pj4+
IC0NCj4gPj4+Pj4gLQkJYW1kZ3B1X2xlZ2FjeV9kcG1fY29tcHV0ZV9jbG9ja3MoaGFuZGxlKTsN
Cj4gPj4+Pj4gLQkJYnJlYWs7DQo+ID4+Pj4+IC0JZGVmYXVsdDoNCj4gPj4+Pj4gLQkJYnJlYWs7
DQo+ID4+Pj4+IC0JfQ0KPiA+Pj4+PiAtCXJldHVybiAwOw0KPiA+Pj4+PiAtfQ0KPiA+Pj4+PiAt
DQo+ID4+Pj4+ICAgICBzdGF0aWMgaW50IHNpX3NldF9zd19zdGF0ZShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikNCj4gPj4+Pj4gICAgIHsNCj4gPj4+Pj4gICAgIAlyZXR1cm4gKGFtZGdwdV9z
aV9zZW5kX21zZ190b19zbWMoYWRldiwNCj4gPj4+PiBQUFNNQ19NU0dfU3dpdGNoVG9Td1N0YXRl
KSA9PSBQUFNNQ19SZXN1bHRfT0spID8NCj4gPj4+Pj4gQEAgLTgxMjUsNyArODA5MSw2IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgYW1kX3BtX2Z1bmNzDQo+ID4+IHNpX2RwbV9mdW5jcw0KPiA+Pj4+
ID0gew0KPiA+Pj4+PiAgICAgCS5wcmludF9wb3dlcl9zdGF0ZSA9ICZzaV9kcG1fcHJpbnRfcG93
ZXJfc3RhdGUsDQo+ID4+Pj4+ICAgICAJLmRlYnVnZnNfcHJpbnRfY3VycmVudF9wZXJmb3JtYW5j
ZV9sZXZlbCA9DQo+ID4+Pj4gJnNpX2RwbV9kZWJ1Z2ZzX3ByaW50X2N1cnJlbnRfcGVyZm9ybWFu
Y2VfbGV2ZWwsDQo+ID4+Pj4+ICAgICAJLmZvcmNlX3BlcmZvcm1hbmNlX2xldmVsID0NCj4gJnNp
X2RwbV9mb3JjZV9wZXJmb3JtYW5jZV9sZXZlbCwNCj4gPj4+Pj4gLQkuc2V0X3Bvd2VyZ2F0aW5n
X2J5X3NtdSA9ICZzaV9zZXRfcG93ZXJnYXRpbmdfYnlfc211LA0KPiA+Pj4+PiAgICAgCS52Ymxh
bmtfdG9vX3Nob3J0ID0gJnNpX2RwbV92YmxhbmtfdG9vX3Nob3J0LA0KPiA+Pj4+PiAgICAgCS5z
ZXRfZmFuX2NvbnRyb2xfbW9kZSA9ICZzaV9kcG1fc2V0X2Zhbl9jb250cm9sX21vZGUsDQo+ID4+
Pj4+ICAgICAJLmdldF9mYW5fY29udHJvbF9tb2RlID0gJnNpX2RwbV9nZXRfZmFuX2NvbnRyb2xf
bW9kZSwNCj4gZGlmZiAtLQ0KPiA+Pj4+IGdpdA0KPiA+Pj4+PiBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG0vcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYw0KPiA+Pj4+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG0vcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYw0KPiA+Pj4+PiBpbmRleCBkYmVkNzJj
MWUwYzYuLjFlYjRlNjEzYjI3YSAxMDA2NDQNCj4gPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jDQo+ID4+Pj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYw0KPiA+Pj4+PiBAQCAtMTUw
MywxNiArMTUwMyw2IEBAIHN0YXRpYyB2b2lkIHBwX3BtX2NvbXB1dGVfY2xvY2tzKHZvaWQNCj4g
Pj4+PiAqaGFuZGxlKQ0KPiA+Pj4+PiAgICAgew0KPiA+Pj4+PiAgICAgCXN0cnVjdCBwcF9od21n
ciAqaHdtZ3IgPSBoYW5kbGU7DQo+ID4+Pj4+ICAgICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYgPSBod21nci0+YWRldjsNCj4gPj4+Pj4gLQlpbnQgaSA9IDA7DQo+ID4+Pj4+IC0NCj4gPj4+
Pj4gLQlpZiAoYWRldi0+bW9kZV9pbmZvLm51bV9jcnRjKQ0KPiA+Pj4+PiAtCQlhbWRncHVfZGlz
cGxheV9iYW5kd2lkdGhfdXBkYXRlKGFkZXYpOw0KPiA+Pj4+PiAtDQo+ID4+Pj4+IC0JZm9yIChp
ID0gMDsgaSA8IEFNREdQVV9NQVhfUklOR1M7IGkrKykgew0KPiA+Pj4+PiAtCQlzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcgPSBhZGV2LT5yaW5nc1tpXTsNCj4gPj4+Pj4gLQkJaWYgKHJpbmcgJiYg
cmluZy0+c2NoZWQucmVhZHkpDQo+ID4+Pj4+IC0JCQlhbWRncHVfZmVuY2Vfd2FpdF9lbXB0eShy
aW5nKTsNCj4gPj4+Pj4gLQl9DQo+ID4+Pj4+DQo+ID4+Pj4+ICAgICAJaWYgKCFhbWRncHVfZGV2
aWNlX2hhc19kY19zdXBwb3J0KGFkZXYpKSB7DQo+ID4+Pj4+ICAgICAJCWFtZGdwdV9kcG1fZ2V0
X2FjdGl2ZV9kaXNwbGF5cyhhZGV2KTsNCj4gPj4+Pj4NCg==
