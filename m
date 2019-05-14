Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9541CF1F
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 20:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1015D892E6;
	Tue, 14 May 2019 18:35:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 2285 seconds by postgrey-1.36 at gabe;
 Tue, 14 May 2019 18:16:05 UTC
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7840288AEF
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 18:16:05 +0000 (UTC)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4EHZY9L003642; Tue, 14 May 2019 10:37:57 -0700
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2sfy23rvac-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 May 2019 10:37:57 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 14 May 2019 10:37:56 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 14 May 2019 10:37:56 -0700
Received: from BYAPR15MB2631.namprd15.prod.outlook.com (20.179.156.24) by
 BYAPR15MB3208.namprd15.prod.outlook.com (20.179.56.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Tue, 14 May 2019 17:37:54 +0000
Received: from BYAPR15MB2631.namprd15.prod.outlook.com
 ([fe80::d4f6:b485:69ee:fd9a]) by BYAPR15MB2631.namprd15.prod.outlook.com
 ([fe80::d4f6:b485:69ee:fd9a%7]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 17:37:54 +0000
From: Roman Gushchin <guro@fb.com>
To: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
Subject: Re: [PATCH 4/4] drm/amdkfd: Check against device cgroup
Thread-Topic: [PATCH 4/4] drm/amdkfd: Check against device cgroup
Thread-Index: AQHVAC55koEwRnit7kyr2zcr6OGdM6Zpe10AgAF7x4A=
Date: Tue, 14 May 2019 17:37:54 +0000
Message-ID: <20190514173749.GA12629@tower.DHCP.thefacebook.com>
References: <20190501145904.27505-1-Harish.Kasiviswanathan@amd.com>
 <20190501145904.27505-5-Harish.Kasiviswanathan@amd.com>
 <20190514015832.GA14741@tower.DHCP.thefacebook.com>
In-Reply-To: <20190514015832.GA14741@tower.DHCP.thefacebook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR14CA0018.namprd14.prod.outlook.com
 (2603:10b6:300:ae::28) To BYAPR15MB2631.namprd15.prod.outlook.com
 (2603:10b6:a03:152::24)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::298]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c4d9b55-db37-4a7c-f1d7-08d6d892e528
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BYAPR15MB3208; 
x-ms-traffictypediagnostic: BYAPR15MB3208:
x-microsoft-antispam-prvs: <BYAPR15MB3208539FCFDB1BDB1FCA3CDDBE080@BYAPR15MB3208.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(396003)(136003)(366004)(39860400002)(189003)(199004)(6436002)(4326008)(25786009)(305945005)(68736007)(73956011)(53936002)(71190400001)(6246003)(7736002)(33656002)(6486002)(66446008)(81156014)(81166006)(14454004)(8936002)(229853002)(186003)(66476007)(66556008)(64756008)(66946007)(52116002)(446003)(478600001)(8676002)(6916009)(316002)(99286004)(1076003)(6116002)(54906003)(6512007)(9686003)(46003)(2906002)(71200400001)(76176011)(14444005)(102836004)(256004)(86362001)(486006)(6506007)(386003)(476003)(11346002)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR15MB3208;
 H:BYAPR15MB2631.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Xm5H8VI7fwaWhGKRqvG7ENl+FZnaZtOyTg0sDMBJhhloGAHmNbkzYg4soB+MvtPYCJfIw9OQjaFre1IpfYnZ816ctUAbmR3kmjoyLB39JFgvN7LmZUaUJ6djUh3rRp1R9+RwaCGsKNEFwaJ5DuzTCsANHqdroE8OAsqGW891XtiBagYrXuSzNbtPoWCeLRBJSgWoVmUPxMG9lp6ywlpYr6OM1s1jtwv6Mn6LUybtl8cqqvmRkCyXSN2Liffr7a+s/Rl/gQk8ODwUDfwOamxBAjbgTaIYxAKdEXPBOZ2PUwqb8bGipFE4vHs6WlRFecUme4+EMMpkpyhfwtxv6kD/2y8WbPLEq0nZKY0Vwy8ENUf3p1XIvs4CGD7KpSctbuDaxjIKP6zbVxutQZZP00fCykakp4ZRCNJxwp9Rt+WMgFo=
Content-ID: <606A94B7321FCC45AB99DA08D0D9361D@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4d9b55-db37-4a7c-f1d7-08d6d892e528
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 17:37:54.3633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3208
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140120
X-FB-Internal: deliver
X-Mailman-Approved-At: Tue, 14 May 2019 18:35:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=UiKD4eIBRQlORSYHHk9+E29AxWlzzgFhNYxpF2gL9Q4=;
 b=grX6znigpdJulaBpqZYlrwuib+rKkSB90Qmrs9C9DAatuLIOmodBaaNvHIZSYeHNDiwe
 tjpiaSET/m9Vn9TCp0zvhlB/iPDOHFAP4WKDulI4NS+0Dt+260EpoZjDcgNKvx6XfPBe
 JhdCuwalQ+NIbtkA0mzkNYqF3zI82DXWycg= 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fb.onmicrosoft.com; s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiKD4eIBRQlORSYHHk9+E29AxWlzzgFhNYxpF2gL9Q4=;
 b=Auba8Tg96eF/qoE8w3sLU70R0LwQ//KO8U9WVTq/hzwNuKaWAYFRPIBHY4mU2OpNHQnQCN+YjsTzljtwFn+oybX2f99/JYY+QsoT0B/HJ7ccHuNlGgMf3ZkMyFmrKooJZkfuJ3uBqDKHJBdOZxsrE8xz+pCxPSjWheKX2zU+lLQ=
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
Cc: "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDE6NTg6NDBBTSArMDAwMCwgUm9tYW4gR3VzaGNoaW4g
d3JvdGU6Cj4gT24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMDI6NTk6MjlQTSArMDAwMCwgS2FzaXZp
c3dhbmF0aGFuLCBIYXJpc2ggd3JvdGU6Cj4gPiBQYXJ0aWNpcGF0ZSBpbiBkZXZpY2UgY2dyb3Vw
LiBBbGwga2ZkIGRldmljZXMgYXJlIGV4cG9zZWQgdmlhIC9kZXYva2ZkLgo+ID4gU28gdXNlIC9k
ZXYvZHJpL3JlbmRlck4gbm9kZS4KPiA+IAo+ID4gQmVmb3JlIGV4cG9zaW5nIHRoZSBkZXZpY2Ug
dG8gYSB0YXNrIGNoZWNrIGlmIGl0IGhhcyBwZXJtaXNzaW9uIHRvCj4gPiBhY2Nlc3MgaXQuIElm
IHRoZSB0YXNrIChiYXNlZCBvbiBpdHMgY2dyb3VwKSBjYW4gYWNjZXNzIC9kZXYvZHJpL3JlbmRl
ck4KPiA+IHRoZW4gZXhwb3NlIHRoZSBkZXZpY2UgdmlhIGtmZCBub2RlLgo+ID4gCj4gPiBJZiB0
aGUgdGFzayBjYW5ub3QgYWNjZXNzIC9kZXYvZHJpL3JlbmRlck4gdGhlbiBwcm9jZXNzIGRldmlj
ZSBkYXRhCj4gPiAocGRkKSBpcyBub3QgY3JlYXRlZC4gVGhpcyB3aWxsIGVuc3VyZSB0aGF0IHRh
c2sgY2Fubm90IHVzZSB0aGUgZGV2aWNlLgo+ID4gCj4gPiBJbiBzeXNmcyB0b3BvbG9neSwgYWxs
IGRldmljZSBub2RlcyBhcmUgdmlzaWJsZSBpcnJlc3BlY3RpdmUgb2YgdGhlIHRhc2sKPiA+IGNn
cm91cC4gVGhlIHN5c2ZzIG5vZGUgZGlyZWN0b3JpZXMgYXJlIGNyZWF0ZWQgYXQgZHJpdmVyIGxv
YWQgdGltZSBhbmQKPiA+IGNhbm5vdCBiZSBjaGFuZ2VkIGR5bmFtaWNhbGx5LiBIb3dldmVyLCBh
Y2Nlc3MgdG8gaW5mb3JtYXRpb24gaW5zaWRlCj4gPiBub2RlcyBpcyBjb250cm9sbGVkIGJhc2Vk
IG9uIHRoZSB0YXNrJ3MgY2dyb3VwIHBlcm1pc3Npb25zLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBIYXJpc2ggS2FzaXZpc3dhbmF0aGFuIDxIYXJpc2guS2FzaXZpc3dhbmF0aGFuQGFtZC5jb20+
Cj4gPiBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
Cj4gCj4gSGVsbG8sIEhhcmlzaCEKPiAKPiBDZ3JvdXAvZGV2aWNlIGNvbnRyb2xsZXIgcGFydCBs
b29rcyBnb29kIHRvIG1lLgo+IFBsZWFzZSwgZmVlbCBmcmVlIHRvIHVzZSBteSBhY2tzIGZvciBw
YXRjaGVzIDMgYW5kIDQ6Cj4gQWNrZWQtYnk6IFJvbWFuIEd1c2hjaGluIDxndXJvQGZiLmNvbT4K
CkhlbGxvIQoKQWZ0ZXIgdGhlIHNlY29uZCBsb29rIGF0IHRoZSBwYXRjaHNldCBJIGNhbWUgdG8g
YW4gdW5kZXJzdGFuZGluZyB0aGF0CmV4cG9ydGluZyBjZ3JvdXBfdjEtb25seSBfX2RldmNncm91
cF9jaGVja19wZXJtaXNzaW9uKCkgaXNuJ3QgdGhlIGJlc3QgaWRlYS4KCkluc3RlYWQgaXQgd291
bGQgYmUgYmV0dGVyIHRvIGV4cG9ydCBkZXZjZ3JvdXBfY2hlY2tfcGVybWlzc2lvbigpLCB3aGlj
aApwcm92aWRlcyBhbiB1bml2ZXJzYWwgaW50ZXJmYWNlIGZvciBib3RoIGNncm91cCB2MSBhbmQg
djIgZGV2aWNlIGNvbnRyb2xsZXJzLgpJdCAgcmVxdWlyZSBzb21lIHJlZmFjdG9yaW5ncywgYnV0
IHNob3VsZCBiZSBub3QgaGFyZC4KCkRvZXMgaXQgbWFrZXMgc2Vuc2UgdG8geW91PyBDYW4geW91
LCBwbGVhc2UsIHJld29yayB0aGlzIHBhcnQ/CgpUaGFua3MhCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
